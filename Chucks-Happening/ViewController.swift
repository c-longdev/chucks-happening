//
//  ViewController.swift
//  Chucks-Happening
//
//  Created by Chandler on 9/9/16.
//  Copyright © 2016 c-longdev. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit
import SwiftKeychainWrapper

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: MaterialTextField!
    @IBOutlet weak var passwordField: MaterialTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.stringForKey(KEY_UID) {
            
            performSegue(withIdentifier: "goToFeed", sender: nil)
            
        }
        
    }

    @IBAction func facebookButtonTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                
                print("Unable to authenticate with facebook")
                
            } else if result?.isCancelled == true{
                
                print("The user has cancelled the request")
                
            }else {
                print("HEYYYYYY!! AUTHENTICATED WITH FACEBOOK")
                let credential =  FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)

                
                
            }
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                
                print("BLAHH Unable to authenticate with firebase - \(error)")
                
            } else {
                
                if let user = user {
                    let userData = ["provider": user.providerID]
                    self.completeSignIn(id: user.uid, userData: userData)
                }
                print("YAYY you authenticated with firebase")
                
            }
        })
        
    }
    
    

    @IBAction func signInTapped(_ sender: AnyObject) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    print("YAY logging you in!")

                    }
                } else {
                    
                   FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                    
                    if error != nil {
                        
                        
                        print("NOOO, unable to authenticate with firebase - \(error)")
                    }else {
                        if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                        
                      print("YAYY sucessfully authenticated with firebase")

                        }
                    }
                    
                   })
                    
                }
            })
            
        }
        
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(id, userData: userData)
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        performSegue(withIdentifier: "goToFeed", sender: nil)
        print("DATA SAVED TO KEYCHAIN \(keychainResult)")
        
    }

}

