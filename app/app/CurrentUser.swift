//
//  CurrentUser.swift
//  app
//
//  Created by Rexana Church on 4/28/17.
//  Copyright © 2017 Rexana Church. All rights reserved.
//

import FirebaseDatabase
import FirebaseAuth

class CurrentUser {
    
    var username: String!
    var phoneNumber: String!
    var id: String!
    
    let dbRef = FIRDatabase.database().reference()
    
    init() {
        let currentUser = FIRAuth.auth()?.currentUser
        username = currentUser?.displayName
        phoneNumber = currentUser?.phoneNumber
        id = currentUser?.uid
    }
    

    
}
