//
//  FirstPageViewController.swift
//  closet
//
//  Created by U-High EngineeringTech on 4/13/20.
//  Copyright © 2020 University High School STEM. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {

    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
   func setUpElements(){
       
        // Style the elements
        Utilities.styleFilledButton(createAccountButton)
        Utilities.styleHollowButton(loginButton)
        Utilities.largeLogo(logoLabel)
    
   }

}
