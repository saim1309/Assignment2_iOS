//
//  UserModel.swift
//  Assignment2
//
//  Created by user174069 on 7/8/20.
//  Copyright © 2020 user174069. All rights reserved.
//

import UIKit

class UserModel:NSObject{
    var name : String
    var email : String
    
    init(name:String,email:String) {
        self.name = name;
        self.email = email;
        super.init()
    }
    
    
    convenience init(id:Int) {
        let email = ["saim@gmail.com", "chitti@gmail.com", "zeefa@gmail.com"]
        let name = ["Saim Ahmad", "Chaitanya Uttarwar", "Zeefa Karim"]
        
        self.init(name: name[id], email: email[id])
    }

}
