//
//  ViewController.swift
//  Assignment2
//
//  Created by user174069 on 7/6/20.
//  Copyright © 2020 user174069. All rights reserved.
//

import UIKit
var users = [String:String]()
class SignUpController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //assigning delegates to UITextFields
        name.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        users["admin"] = "admin123";
        
        
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        name.resignFirstResponder();
        email.resignFirstResponder();
        password.resignFirstResponder();
        password.resignFirstResponder();
        confirmPassword.resignFirstResponder();
    }
    
    
    
    //function to register user
        func registerUser(username:String, password:String){
            //variable to check if user is registered
            var isAlreadyRegistered:Bool = false;
            //iterating through users dictionary
            for(key,_) in users{
                //print("Users[username]"+users[username]! ?? " No username")
                
                if(username==key){
                    //email is already registered in the system
                    //print("email already registered");
                    isAlreadyRegistered = true;
                    //using custom alert to notify user that Email is already registered
                    showAlert(title: "Registeration Failed",message: "Email already registered");
                    break;
                }
            }
            //it is new user and we need to register him in system
            if(isAlreadyRegistered == false){
                //adding the new user in dictionary
                users[username] = password;
                //print(users[username]!);
                //using custom alert to notify user that Registeration was Successful
                showAlert(title: "Registeration Complete",message: "Go to login page to login");
            }
            
    //        for(key,value) in users{
    //            print("key: \(key) and its value: \(value)");
    //        }

        }//end of register user function
    
    
    
    
    //custom alert function
    func showAlert(title:String, message:String) {
        let alertController = UIAlertController(title: title, message:
        message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))

        self.present(alertController, animated: true, completion: nil)
    }

    
    
    //function to clear signUp Page once user is successfully registered
    func clearSignUpPage(){
        name.text! = "";
        email.text! = "";
        password.text! = "";
        confirmPassword.text! = "";
    }
    
    
    
    //function to validate all inputs from user for registeration
    func validateInput(nameStr: String,emailStr:String, passwordStr:String, confirmPasswordStr:String) -> Bool{
        
        //Regex for email.
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}";
        //NSPredicate matches the input email against the regex provided above and set emailValidation variable true if found ok
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx);
        let emailValidation:Bool =  emailPred.evaluate(with: emailStr);
        
        //check all fields are filled
        if(nameStr == "" || emailStr == "" || passwordStr == "" || confirmPasswordStr == ""){
            showAlert(title: "Empty Fields",message: "All fields are mandatory");
            return false;
        }
        //both the password should match
        else if(passwordStr != confirmPasswordStr) {
            showAlert(title: "Password Mismatch",message: "Enter password should match");
            return false;
        }
        //check the lenght of passowrd (min 5 charecters)
        else if(passwordStr.count < 5 && confirmPasswordStr.count < 5){
            showAlert(title: "Password Length",message: "password length should be min 5 charecters");
            return false;
        }
        //check if email validation was successful
        else if(!emailValidation){
            showAlert(title: "Email Validation",message: "Enter valid email address");
            return false;
        }
        else{
            //user input passed all the validation
            return true;
        }
        
    }//end of validation input
    

    @IBAction func signUpPressed(_ sender: UIButton) {
        
        //getting string value for all input fields
        let nameStr:String = name.text!;
        let emailStr:String = email.text!;
        let passwordStr:String = password.text!;
        let confirmPasswordStr:String = confirmPassword.text!;
        
        //validationPassed variable stores true of input passed all validations
        let validationPassed:Bool =  validateInput(nameStr: nameStr,emailStr: emailStr,passwordStr: passwordStr,confirmPasswordStr: confirmPasswordStr);
        
        if(validationPassed){
            print("Name: \(name.text!)\nemail: \(email.text!)\npassword: \(password.text!)\nconfirmpassword: \(confirmPassword.text!)");
            
            //call register user function with email and password
            registerUser(username: emailStr, password: passwordStr);
            
            //clear function called after successful register
            clearSignUpPage();
            //showAlert(title: "Register Complete",message: "Go to login page to login");
            
        }
        else{
            //input validation failed
            print("Validation failed");
            
            //using custom alert to notify user that Registeration failed
            showAlert(title: "Registeration Failed",message: "Please try again!");
        }
        
    }//end of signupPressed
    
}

//dissapears keyboard when 'return' is pressed on keyboard
extension SignUpController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

