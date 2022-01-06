//
//  ViewImageCollection.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 20/12/2021.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore


class ViewBouquetsCollectionVC: UIViewController {
  
  @IBOutlet weak var viewBouquetImage: UIImageView!
  @IBOutlet weak var viewBouquetPrice: UILabel!
  @IBOutlet weak var viewBouquetName: UILabel!
  @IBOutlet weak var addToCartForBouquets: UIButton!
  
  
  var bouquetImage: UIImage!
  var bouquetPrice: Double = 0.0
  var bouquetName: String = ""
  
  let db = Firestore.firestore()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addToCartForBouquets.layer.cornerRadius = 20
    addToCartForBouquets.layer.borderColor = UIColor.gray.cgColor
    addToCartForBouquets.layer.borderWidth = 1
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    viewBouquetImage.image = bouquetImage
    viewBouquetPrice.text = "\(bouquetPrice)SAR"
    viewBouquetName.text = bouquetName
    
    let user = Auth.auth().currentUser
    print(user?.uid)
    if let currentUser = user {
      db.collection("bouquets").document().getDocument{ doc , err in
      if err != nil {
       print(err!)
      }
      else{
       let data = doc!.data()!
        
       self.bouquetImage = data["image"] as! UIImage
        self.bouquetPrice = data["image name"] as! Double
       self.bouquetName = data["image price"] as! String
     //  print(“**********DATA : \(data)“)
        
        
       self.viewBouquetImage.image = self.bouquetImage
        self.viewBouquetPrice.text = "\(self.bouquetPrice)"
       self.viewBouquetName.text = self.bouquetName
       }
     }
    }
    
  }
  
  
  @IBAction func addToCartPressed(_ sender: UIButton) {
    
    
  }
  
}
