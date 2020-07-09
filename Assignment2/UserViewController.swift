//
//  UserViewController.swift
//  Assignment2
//
//  Created by user174069 on 7/8/20.
//  Copyright © 2020 user174069. All rights reserved.
//

import UIKit

class UserViewController: UITableViewController {
    var userCollection : UserCollection!
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
         userCollection = UserCollection()
        //let itemsController = window!.rootViewController as! ItemsVewController
        //UserViewController.UserC = userCollection
    }
    //defines number if rows our table will have
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return userCollection.allUsers.count
    }
    //defines the number of section our table will have
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    //defines how one row will look like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell {
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = userCollection.allUsers[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
