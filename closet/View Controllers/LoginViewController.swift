//
//  LoginViewController.swift
//  closet
//
//  Created by U-High EngineeringTech on 4/13/20.
//  Copyright © 2020 University High School STEM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
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
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
    func showError(_ message: String){
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."
        }
        return nil
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        // Validate text fields
            let error = validateFields()
            
            if error != nil {
                // There's something wrong with the fields, show error message
                showError(error!)
            }else{
                // Create cleaned version of the text field
            
                let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                // Signing in the user
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                    if error != nil {
                        self.errorLabel.text = error!.localizedDescription
                        self.errorLabel.alpha = 1
                    }else{
                        let tabBarViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabBarViewController) as? TabBarViewController
                        
                        self.view.window?.rootViewController = tabBarViewController
                        self.view.window?.makeKeyAndVisible()
                    }
                }
            
            }
    }
    
}
