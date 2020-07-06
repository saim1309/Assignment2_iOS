//
//  ViewController.swift
//  Assignment2
//
//  Created by user174069 on 7/6/20.
//  Copyright © 2020 user174069. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self;
        password.delegate = self;
        // Do any additional setup after loading the view.
    }
    
    //function to check if user is registerd or not
    func checkUser(email:String, password: String)->Bool{
        for(key,value) in users{
            if(email==key && password==value){
                //user is registered in the system
                return true;
            }
        }
        return false;
    }//end of check user
    
    //function to remove keyboard when touched outside text fields

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        email.resignFirstResponder();
        password.resignFirstResponder();
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
        //print("username ",username.text!);
        //print("password ", password.text!);
        
        //result variable will be true if user is registered
        let result:Bool = checkUser(email: email.text!,password: password.text!)
        if(result == true){
            //user is registered
            //showAlert(title: "Login Success", message: "Cograts!")
            if(email.text! == "admin@123.com"){
                //navigate to admin home screen
                performSegue(withIdentifier: "adminHome", sender: self)
                print("Admin Login success")
            }
            else{
                //navigate to admin user screen
                performSegue(withIdentifier: "userHome", sender: self)
                print("User Login success")
            }
            
            //    performSegue(withIdentifier: "home", sender: self)
           
        }
        else{
            //user is not registered
            showAlert(title: "Login Failed", message: "Check your email and password!")
        }
        
    }//end of login pressed
    
    
    //custom alert function created
    func showAlert(title:String, message:String) {
        let alertController = UIAlertController(title: title, message:
        message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))

        self.present(alertController, animated: true, completion: nil)
    }
    
}


//dissapears keyboard when 'return' is pressed on keyboard
extension LoginController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

