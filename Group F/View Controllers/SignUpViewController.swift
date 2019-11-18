//
//  SignUpViewController.swift
//  Group F
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 4S. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements () {
        
        // Hide Elements
        messageLabel.alpha = 0
        
        // Style Elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
       
    }
    
// Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returs the error messages
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                    return "Please fill in required fields."
        }
        
        // Check if password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            
            return " Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        // Validate the Fields
        let error = validateFields()
        
        if error != nil {
            //There's something wrong with fields, show error message
            showError(error!)
        }
        else {
            
        // Create User
            Auth.auth().createUser(withEmail: "", password: "") { (result, err) in
                
                //check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error Creating User")
            }
            else {
                    
                // User was Created Succesfully, now store the first name and last name
                    let db = Firestore.firestore()
                }
            }
        
        // Transition to the home screen
        }
        
    }
    
    func showError(_ message:String) {
        messageLabel.text = message
        messageLabel.alpha = 1
    }
}
