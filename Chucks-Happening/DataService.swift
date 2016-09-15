//
//  DataService.swift
//  Chucks-Happening
//
//  Created by Chandler on 9/13/16.
//  Copyright © 2016 c-longdev. All rights reserved.
//

import Foundation
import Firebase
import UIKit

let DB_BASE = FIRDatabase.database().reference() //contains the root of our database

class DataService {
    
    static let ds = DataService()
    
    fileprivate var _REF_BASE = DB_BASE
    fileprivate var _REF_POSTS = DB_BASE.child("posts")
    fileprivate var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: FIRDatabaseReference {
        
        return _REF_BASE
        
    }
    
    var REF_POSTS: FIRDatabaseReference {
        
        return _REF_POSTS
        
    }
    
    var REF_USERS: FIRDatabaseReference {
        
        return _REF_USERS
        
    }
    
    //creating a new user into the firebase database
 
    func createFirebaseDBUser(_ uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
