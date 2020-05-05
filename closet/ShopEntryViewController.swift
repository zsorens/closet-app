//
//  ShopEntryViewController.swift
//  closet
//
//  Created by U-High EngineeringTech on 5/2/20.
//  Copyright © 2020 University High School STEM. All rights reserved.
//

import UIKit

class ShopEntryViewController: UIViewController {
    
    let password = "ShopPassword1"
    
    
    // UI Elements
    @IBOutlet weak var accessLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        accessLabel.textColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        Utilities.styleTextFieldTwo(passwordTextField)
        Utilities.styleFilledButtonShopEntryPage(goButton)

        // Do any additional setup after loading the view.
    }
    
    func showError(_ message: String){
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }

    
    
    @IBAction func goButtonTapped(_ sender: Any) {
        // check that password is valid
        if passwordTextField.text! != password{
            showError("Wrong password.")
        }else{
            // navigate to shop page
            let shopViewController = self.storyboard?.instantiateViewController(identifier: Constants.StoryboardTwo.shopViewController) as? ShopViewController
            
            self.view.window?.rootViewController = shopViewController
            self.view.window?.makeKeyAndVisible()
        }
        
        
        
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
