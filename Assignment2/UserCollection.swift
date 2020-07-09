//
//  UserCollection.swift
//  Assignment2
//
//  Created by user174069 on 7/8/20.
//  Copyright © 2020 user174069. All rights reserved.
//

import UIKit

class UserCollection {
    var allUsers = [UserModel]()
    
    func createUser(i:Int)->UserModel {
        let newUser = UserModel(id:i)
        print("new user",newUser)
        allUsers.append(newUser)
        return newUser;
    }
    
    init() {
        for i in 0..<3 {
            createUser(i: i)
        }
        print("all users array", allUsers)
    }
    

}
