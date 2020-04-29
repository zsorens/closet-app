//
//  Utilities.swift
//  uhscloset
//
//  Created by U-High EngineeringTech on 3/18/20.
//  Copyright © 2020 University High School STEM. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    

    static func styleHeader(_ label : UILabel) {
        label.font = UIFont(name: "Avenir Next", size: 30.0)
        label.textColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
    }
    static func styleCategoryLabel(_ label: UILabel){
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
    }
    
    static func largeLogo(_ label: UILabel) {
        label.font = UIFont(name:"Avenir Next", size: 80.0)
    }
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
    }
    
    static func styleHollowButtonDonatePage(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.white
        button.setTitleColor(UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1), for: UIControl.State.normal)
        button.backgroundColor = UIColor.white
    }
    
    static func styleHollowButtonDonatePageSize(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        button.layer.cornerRadius = 15.0
        button.tintColor = UIColor.white
        button.setTitleColor(UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1), for: UIControl.State.normal)
        button.backgroundColor = UIColor.white
    }
    
    static func styleHollowButtonDonatePageFit(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        button.layer.cornerRadius = 15.0
        button.tintColor = UIColor.white
        button.setTitleColor(UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1), for: UIControl.State.normal)
        button.backgroundColor = UIColor.white
    }
    
    static func styleFilledButtonDonatePage(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.white
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)

    }
    
    static func styleFilledButtonDonatePageSize(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 15.0
        button.tintColor = UIColor.white
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)

    }
    
    static func styleFilledButtonDonatePageFit(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 15.0
        button.tintColor = UIColor.white
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)

    }
    
    static func styleDonateButton(_ button: UIButton) {
        button.backgroundColor = UIColor.systemYellow
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.white
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        // let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        // return passwordTest.evaluate(with: password)
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
      
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
}
