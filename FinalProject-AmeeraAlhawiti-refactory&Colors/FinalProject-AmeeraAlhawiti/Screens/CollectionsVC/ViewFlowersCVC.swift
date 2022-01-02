//
//  ViewFlowersCollection.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 23/12/2021.
//

import UIKit

class ViewFlowersCollectionVC: UIViewController {
  
 
  @IBOutlet weak var viewFlowerImage: UIImageView!
  @IBOutlet weak var viewFlowerName: UILabel!
  @IBOutlet weak var viewFlowerPrice: UILabel!
  @IBOutlet weak var addToCartForFlowers: UIButton!
  
  
  var flowerImage: UIImage!
  var flowerPrice: Double = 0.0
  var flowerName: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addToCartForFlowers.layer.cornerRadius = 20
    addToCartForFlowers.layer.borderColor = UIColor.gray.cgColor
    addToCartForFlowers.layer.borderWidth = 1
    
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    viewFlowerImage.image = flowerImage
    viewFlowerPrice.text = "\(flowerPrice) SAR"
    viewFlowerName.text = flowerName
  }
  
}
