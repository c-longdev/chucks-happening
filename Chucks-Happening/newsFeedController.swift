//
//  newsFeedController.swift
//  Chucks-Happening
//
//  Created by Chandler on 9/12/16.
//  Copyright © 2016 c-longdev. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class newsFeedController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts = [Post]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.ds.REF_POSTS.observe(.value, with: {(snapshot) in
            print(snapshot.value)
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshot {
                    
                    print("SNAP: \(snap)")
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        
                        let key = snap.key
                        let post = Post(postKey: key, postData: postDict)
                        self.posts.append(post)
                    }
                }
                
            }
            self.tableView.reloadData()
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell{
            
            cell.configureCell(post: post)
            
            return cell
            
        } else {
            
            return PostCell()
            
        }
    }
    
    
    
    
    @IBAction func signOutButton(_ sender: AnyObject) {
        
        let keyChainResult = KeychainWrapper.removeObjectForKey(KEY_UID)
        print("YOU HAVE BEEN REMOVED FROM KEYCHAIN")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
        
    }
    
}
