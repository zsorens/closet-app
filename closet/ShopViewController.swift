//
//  ShopViewController.swift
//  closet
//
//  Created by U-High EngineeringTech on 5/2/20.
//  Copyright © 2020 University High School STEM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage

class ShopViewController: UIViewController {

//    var uids : Array<String>?
    
    // UI Elements
    @IBOutlet weak var headerLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleHeader(headerLabel)
        // Do any additional setup after loading the view.
//        let myCustomViewController: DonateViewController = DonateViewController(nibName: nil, bundle: nil)
//        var getUIDArray = myCustomViewController.uidArray
//        uids = getUIDArray
        addItems()
    }
    

    // add new items to the shopping page
    private func addItems(){
        // database reference
        let db = Firestore.firestore()
        // make sure values are in array
//        if uids!.isEmpty{
//            print("there are no values in the array")
//            return
//        }
//        let docRef = db.collection("Item").document(uids![0])
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
        db.collection("Item").document("dM1e5m46IMWD2YzVFEIG").getDocument { (document, error) in
            if error == nil {
                if document != nil && document!.exists {
                    let documentData = document!.data()
                    var itemFit : String = documentData!["Fit"] as! String
                    var itemType : String = documentData!["Item Type"] as! String
                    var itemSize : String = documentData!["Size"] as! String
                    
                    
                    self.buildItemView(fit: itemFit, type: itemType, size: itemSize)
                }
            }
        }

    }
    
    private func buildItemView(fit: String, type: String, size: String){
        let fitLabel : UILabel = {
            let label = UILabel()
            label.text = "Fit: " + fit
            label.textColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
            return label
        }()
        self.view.addSubview(fitLabel)
        fitLabel.translatesAutoresizingMaskIntoConstraints = false
        fitLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        fitLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        let typeLabel : UILabel = {
            let label = UILabel()
            label.text = "Type: " + type
            label.textColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
            return label
        }()
        self.view.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.leftAnchor.constraint(equalTo: fitLabel.rightAnchor, constant: 20).isActive = true
        typeLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        let sizeLabel : UILabel = {
            let label = UILabel()
            label.text = "Size: " + size
            label.textColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
            return label
        }()
        self.view.addSubview(sizeLabel)
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeLabel.leftAnchor.constraint(equalTo: typeLabel.rightAnchor, constant: 20).isActive = true
        sizeLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true

        
        
        
        
    }

   


}
