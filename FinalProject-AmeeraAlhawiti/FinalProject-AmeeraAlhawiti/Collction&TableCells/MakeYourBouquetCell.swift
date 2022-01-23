//
//  MakeYourBouquetCVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 21/12/2021.
//

import UIKit

class MakeYourBouquetCell: UICollectionViewCell {
    
  @IBOutlet weak var flowerImage: UIImageView!
  @IBOutlet weak var flowerName: UILabel!
  @IBOutlet weak var flowerPrice: UILabel!
  @IBOutlet weak var addToFavoraite: UIButton!
  @IBOutlet weak var addToCart: UIButton!
  
  
  
  
  
  
  func setUpFlowerCell(image: UIImage, price: Double, imageName: String){
    flowerImage.image = image
    flowerPrice.text = "\(price) SAR"
    flowerName.text = "\(imageName)"
  }
  
  
  
  @IBAction func addToFavoraiteButtonPressed(_ sender: UIButton) {
   
  }
  
  
  
  @IBAction func addToCartButtonPressed(_ sender: UIButton) {
    
//    self.show.showAlertView()
  }
  

}
