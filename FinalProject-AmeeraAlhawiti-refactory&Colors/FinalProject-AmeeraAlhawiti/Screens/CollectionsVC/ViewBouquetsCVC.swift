//
//  ViewImageCollection.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 20/12/2021.
//

import UIKit


class ViewBouquetsCollectionVC: UIViewController {
  
  @IBOutlet weak var viewBouquetImage: UIImageView!
  @IBOutlet weak var viewBouquetPrice: UILabel!
  @IBOutlet weak var viewBouquetName: UILabel!
  @IBOutlet weak var addToCartForBouquets: UIButton!
  
  
  var bouquetImage: UIImage!
  var bouquetPrice: Double = 0.0
  var bouquetName: String = ""
  
  
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
    
  }
  
  
  @IBAction func addToCartPressed(_ sender: UIButton) {
    
    
  }
  
}
