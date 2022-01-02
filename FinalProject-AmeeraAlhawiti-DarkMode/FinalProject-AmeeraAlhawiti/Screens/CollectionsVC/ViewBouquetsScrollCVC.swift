//
//  BouquetsScrollCVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 29/12/2021.
//

import UIKit

class ViewBouquetsScrollCVC: UIViewController{

  
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var price: UILabel!
  
  
  var imageOfBouquet: UIImage!
  var priceOfBouquet: Double = 0.0
  var nameOfBouquet: String = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    addToCartForBouquets.layer.cornerRadius = 20
//    addToCartForBouquets.layer.borderColor = UIColor.gray.cgColor
//    addToCartForBouquets.layer.borderWidth = 1
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    image.image = imageOfBouquet
    price.text = "\(priceOfBouquet)SAR"
    name.text = nameOfBouquet
    
  }
}
