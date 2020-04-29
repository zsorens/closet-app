//
//  DonateViewController.swift
//  closet
//
//  Created by U-High EngineeringTech on 4/14/20.
//  Copyright © 2020 University High School STEM. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage


class DonateViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    
    // UI element variables
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var imageAImageView: UIImageView!
    @IBOutlet weak var selectItemTypeLabel: UILabel!
    @IBOutlet weak var spiritWearButton: UIButton!
    @IBOutlet weak var danceAttireButton: UIButton!
    @IBOutlet weak var sportsItemButton: UIButton!
    @IBOutlet weak var otherItemTypeButton: UIButton!
    @IBOutlet weak var fitLabel: UILabel!
    @IBOutlet weak var mensButton: UIButton!
    @IBOutlet weak var womensButton: UIButton!
    @IBOutlet weak var naButton: UIButton!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var xsButton: UIButton!
    @IBOutlet weak var sButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var lbutton: UIButton!
    @IBOutlet weak var xlButton: UIButton!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var donateButton: UIButton!
    
    // image variable
    var imagePicker: UIImagePickerController!
    
    // donate data variables
    // set them as nil before user selects data
    var itemType : String? = nil
    var fit : String? = nil
    var size: String? = nil
    
    // creates a label that says "Select Size:"
//    let sizeOptionLabel: UILabel = {
//        let label = UILabel.init()
//        label.text = "Select Size:"
//        label.textColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
//    let sportTextField: UITextField = {
//        let textField = UITextField.init()
//        textField.placeholder = "Please type sport here"
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.borderStyle = UITextField.BorderStyle.line
//        textField.font = UIFont.systemFont(ofSize: 10)
//        textField.layer.borderColor = UIColor.lightGray.cgColor
//        textField.layer.borderWidth = 0.25
//        textField.layer.cornerRadius = 5.0
//
//        return textField
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    
    func setUpElements() {
        Utilities.styleHeader(headerLabel)
        Utilities.styleCategoryLabel(selectItemTypeLabel)
        Utilities.styleHollowButtonDonatePage(spiritWearButton)
        Utilities.styleHollowButtonDonatePage(danceAttireButton)
        Utilities.styleHollowButtonDonatePage(sportsItemButton)
        Utilities.styleHollowButtonDonatePage(otherItemTypeButton)
        Utilities.styleCategoryLabel(fitLabel)
        Utilities.styleHollowButtonDonatePageFit(mensButton)
        Utilities.styleHollowButtonDonatePageFit(womensButton)
        Utilities.styleHollowButtonDonatePageFit(naButton)
        Utilities.styleCategoryLabel(sizeLabel)
        Utilities.styleHollowButtonDonatePageSize(xsButton)
        Utilities.styleHollowButtonDonatePageSize(sButton)
        Utilities.styleHollowButtonDonatePageSize(mButton)
        Utilities.styleHollowButtonDonatePageSize(lbutton)
        Utilities.styleHollowButtonDonatePageSize(xlButton)
        Utilities.styleDonateButton(donateButton)
        Utilities.styleFilledButtonDonatePage(takePhotoButton)
        descriptionTextField.backgroundColor = UIColor.white
    }

    
    // allows user to take a photo
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera

        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageAImageView.image = info[.originalImage] as? UIImage
    }
    
    @IBAction func spiritWearButtonTapped(_ sender: Any) {
        
        // Fill tapped button
        Utilities.styleFilledButtonDonatePage(spiritWearButton)
        
        // Make sure no other buttons are filled
        Utilities.styleHollowButtonDonatePage(danceAttireButton)
        Utilities.styleHollowButtonDonatePage(sportsItemButton)
        Utilities.styleHollowButtonDonatePage(otherItemTypeButton)
        
        // Change the data value for item type
        itemType = "Spirit Wear"
        
        
    }
    
    
    @IBAction func danceAttireButtonTapped(_ sender: Any) {
        
        // Fill tapped button
        Utilities.styleFilledButtonDonatePage(danceAttireButton)
        
        // Make sure no other buttons are filled
        Utilities.styleHollowButtonDonatePage(spiritWearButton)
        Utilities.styleHollowButtonDonatePage(sportsItemButton)
        Utilities.styleHollowButtonDonatePage(otherItemTypeButton)
        
        // Change the data value for item type
        itemType = "Dance Attire"
                
    }

    
    @IBAction func sportsItemButtonTapped(_ sender: Any) {
        
        // Fill tapped button
        Utilities.styleFilledButtonDonatePage(sportsItemButton)
        
        // Make sure no other buttons are filled
        Utilities.styleHollowButtonDonatePage(danceAttireButton)
        Utilities.styleHollowButtonDonatePage(spiritWearButton)
        Utilities.styleHollowButtonDonatePage(otherItemTypeButton)
        
        // Add the sport text field
//        self.view.addSubview(sportTextField)
        
        // Add constraints for sport text field
//        sportTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
//        sportTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
//        sportTextField.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 20).isActive = true
//        sportTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
//
//        // Move text field for other description down
//        descriptionTextField.topAnchor.constraint(equalTo: sportTextField.bottomAnchor, constant: 20).isActive = true
        
        // Change the data value for item type
        itemType = "Sports Item"
        
        

    }
    
    
    
    @IBAction func otherItemTypeButtonTapped(_ sender: Any) {
        
        // Fill tapped button
        Utilities.styleFilledButtonDonatePage(otherItemTypeButton)
        
        // Make sure no other buttons are filled
        Utilities.styleHollowButtonDonatePage(danceAttireButton)
        Utilities.styleHollowButtonDonatePage(sportsItemButton)
        Utilities.styleHollowButtonDonatePage(spiritWearButton)
        
        // Change the data value for item type
        itemType = "Other"
        
        

    }
    
    @IBAction func mensButtonTapped(_ sender: Any) {
        Utilities.styleFilledButtonDonatePageFit(mensButton)
        Utilities.styleHollowButtonDonatePageFit(womensButton)
        Utilities.styleHollowButtonDonatePageFit(naButton)
        
        // change state of fit
        fit = "Men's"
    }
    
    @IBAction func womensButtonTapped(_ sender: Any) {
        Utilities.styleFilledButtonDonatePageFit(womensButton)
        Utilities.styleHollowButtonDonatePageFit(mensButton)
        Utilities.styleHollowButtonDonatePageFit(naButton)
        
        // change state of fit
        fit = "Women's"
    }
    
    @IBAction func naButtonTapped(_ sender: Any) {
        Utilities.styleFilledButtonDonatePageFit(naButton)
        Utilities.styleHollowButtonDonatePageFit(womensButton)
        Utilities.styleHollowButtonDonatePageFit(mensButton)
        
        // change state of fit
        fit = "N/A"
    }
    
    @IBAction func xsButtonTapped(_ sender: Any) {
        Utilities.styleFilledButtonDonatePageSize(xsButton)
        Utilities.styleHollowButtonDonatePageSize(sButton)
        Utilities.styleHollowButtonDonatePageSize(mButton)
        Utilities.styleHollowButtonDonatePageSize(lbutton)
        Utilities.styleHollowButtonDonatePageSize(xlButton)
        
        // change state of size
        size = "XS"
        
        
    }
    
    @IBAction func sButtonTapped(_ sender: Any) {
        Utilities.styleFilledButtonDonatePageSize(sButton)
        Utilities.styleHollowButtonDonatePageSize(xsButton)
        Utilities.styleHollowButtonDonatePageSize(mButton)
        Utilities.styleHollowButtonDonatePageSize(lbutton)
        Utilities.styleHollowButtonDonatePageSize(xlButton)
        
        // change state of size
        size = "S"
    }
    
    @IBAction func mButtonTapped(_ sender: Any) {
        Utilities.styleFilledButtonDonatePageSize(mButton)
        Utilities.styleHollowButtonDonatePageSize(sButton)
        Utilities.styleHollowButtonDonatePageSize(xsButton)
        Utilities.styleHollowButtonDonatePageSize(lbutton)
        Utilities.styleHollowButtonDonatePageSize(xlButton)
        
        // change state of size
        size = "M"
    }
    
    @IBAction func lButtonTapped(_ sender: Any) {
        Utilities.styleFilledButtonDonatePageSize(lbutton)
        Utilities.styleHollowButtonDonatePageSize(sButton)
        Utilities.styleHollowButtonDonatePageSize(mButton)
        Utilities.styleHollowButtonDonatePageSize(xsButton)
        Utilities.styleHollowButtonDonatePageSize(xlButton)
        
        // change state of size
        size = "L"
    }
    
    @IBAction func xlButtonTapped(_ sender: Any) {
        Utilities.styleFilledButtonDonatePageSize(xlButton)
        Utilities.styleHollowButtonDonatePageSize(sButton)
        Utilities.styleHollowButtonDonatePageSize(mButton)
        Utilities.styleHollowButtonDonatePageSize(lbutton)
        Utilities.styleHollowButtonDonatePageSize(xsButton)
        
        // change state of size
        size = "XL"
    }
    
    @IBAction func donateButtonTapped(_ sender: Any) {
        
    }
    
    
    
    // @objc fileprivate func uploadPhoto() {
        // activityIndicator.startAnimating()
        // guard let image = imageAImageView.image, let data = image.jpegData(compressionQuality: 1.0)
            // else{
                // presentAlert(title: "Error", message: "Something went wrong.")
                // return
        // }
        // let imageName = UUID().uuidString
        // let imageReference = Storage.storage().reference().child(MyKeys.imagesFolder).child(imageName)
        
        
    // }
    
    
}
