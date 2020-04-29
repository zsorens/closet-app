//
//  CreateAccountViewController.swift
//  closet
//
//  Created by U-High EngineeringTech on 4/13/20.
//  Copyright © 2020 University High School STEM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateAccountViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var graduationYearTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var verifyPasswordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(graduationYearTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleTextField(verifyPasswordTextField)
        Utilities.styleFilledButton(createAccountButton)
        
    }
    
    // Check the fields and validate that the data is correct. If everything is correct, the method returns nil. Otherwise, it returns the error message as a string.
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            graduationYearTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            verifyPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            {
            return "Please fill in all fields."
            }
        
        // Check if password is valid
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // if Utilities.isPasswordValid(cleanedPassword) == false{
            // return "Please make sure your password is at least 8 characters, and contains at least one uppercase letter, lowercase number, and number."
        // }
        let cleanedVerifyPassword = verifyPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanedPassword != cleanedVerifyPassword{
            return "Please make sure passwords match."
        }
        
        // Check if email is valid
        // let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // if Utilities.isValidEmail(cleanedEmail) == false{
            // return "Please enter a valid email."
        // }
        
        
        return nil
    }
    

    @IBAction func createAccountPressed(_ sender: Any) {
    // Validate the fields
        let error = validateFields()
        
        if error != nil {
            // There's something wrong with the fields, show error message
            showError(error!)
        }else{
            
            // Create cleaned version of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let graduationYear = graduationYearTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                    
                }else{
                    
                    // User was created successfully, now store the first name, last name, and grad year
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname" : firstName, "lastname": lastName, "graduationYear" : graduationYear, "uid" : result!.user.uid]) { (error) in
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                    
                }
            }
        }
    }
            
    
    func transitionToHome(){
        
        let tabBarViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabBarViewController) as? TabBarViewController
        
        view.window?.rootViewController = tabBarViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    func showError(_ message: String){
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
}
