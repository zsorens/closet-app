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
import Firebase


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
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var donateButton: UIButton!
    
    // image variable
    var imagePicker: UIImagePickerController!
    
    // donate data variables
    // set them as nil before user selects data
    var itemType : String? = nil
    var fit : String? = nil
    var size: String? = nil
    var otherDescription = "none"
    var isNew = true
    var savedBy = "none"
    
    // public array of uids of data in firestore so I can use them in shop view
    public var uidArray = [String]()
    
    
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
       
        Utilities.styleTextFieldTwo(descriptionTextField)
        errorLabel.alpha = 0
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
    
    @IBAction func otherDescriptionTextEdited(_ sender: Any) {
        otherDescription = descriptionTextField.text!
    }
    
    
    @IBAction func donateButtonTapped(_ sender: Any) {
        // check that the values have been filled in
        if (itemType == nil) || (fit == nil) || (size == nil){
            self.showError("Please make sure all fields have a selection.")
            return
        }
        
        // store jpeg representation of image in variable
        guard let image = imageAImageView.image,
            let data = image.jpegData(compressionQuality: 1.0)
            else{
                showError("Something went wrong.")
                return
        }
        // get UUID and store it in storage
        let imageName = UUID().uuidString
        let imageReference = Storage.storage().reference().child("images").child(imageName)
        
        
        imageReference.putData(data, metadata: nil) { (metadat, err) in
            if let err = err {
                self.showError(err.localizedDescription)
                return
            }
            imageReference.downloadURL(completion: { (url, err) in
                if let err = err {
                    self.showError(err.localizedDescription)
                    return
                }
                
                guard let url = url else {
                    self.showError("Soemthing went wrong.")
                    return
                }
                
                let dataReference = Firestore.firestore().collection("Item").document()
                let documentUID = dataReference.documentID
                self.uidArray.append(documentUID)                                       // add this uid to the array
                let urlString = url.absoluteString
                // storing all of the data in firestore
                dataReference.setData([
                    "Is New Item" : self.isNew, "Item Type" : self.itemType!, "Fit" : self.fit!, "Size" : self.size!, "Other Description" : self.otherDescription,  "UID" : documentUID, "imageURL" : urlString, "Saved by" : self.savedBy
                ]) { (err) in
                    if let err = err {
                        self.showError(err.localizedDescription)
                        return
                    }
                    // alert the user that they were successful
                    let alert = UIAlertController(title: "Donation recieved!", message: "Thank you for donating.", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
    
                    self.present(alert, animated: true)
                    self.clearFields()
                    
                    UserDefaults.standard.set(documentUID, forKey: "uid")       // the key might mess this up I am confused
                    
                
                }
                
            })
            
        }

        
    }
    
    func clearFields(){
        
        self.imageAImageView.image = UIImage()
        
        Utilities.styleHollowButtonDonatePage(spiritWearButton)
        Utilities.styleHollowButtonDonatePage(danceAttireButton)
        Utilities.styleHollowButtonDonatePage(sportsItemButton)
        Utilities.styleHollowButtonDonatePage(otherItemTypeButton)
        itemType = nil
        
        
        Utilities.styleHollowButtonDonatePageFit(mensButton)
        Utilities.styleHollowButtonDonatePageFit(womensButton)
        Utilities.styleHollowButtonDonatePageFit(naButton)
        fit = nil
        
        Utilities.styleHollowButtonDonatePageSize(lbutton)
        Utilities.styleHollowButtonDonatePageSize(sButton)
        Utilities.styleHollowButtonDonatePageSize(mButton)
        Utilities.styleHollowButtonDonatePageSize(xsButton)
        Utilities.styleHollowButtonDonatePageSize(xlButton)
        size = nil
        
        otherDescription = "none"
        descriptionTextField.text = nil
        
    }
    
    func showError(_ message: String){
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    

    
    
}
