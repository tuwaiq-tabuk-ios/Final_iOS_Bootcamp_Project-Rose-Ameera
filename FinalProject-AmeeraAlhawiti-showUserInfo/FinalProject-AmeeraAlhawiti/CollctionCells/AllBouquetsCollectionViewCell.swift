//
//  AllBouquetsCollectionViewCell.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 20/12/2021.
//

import UIKit

class AllBouquetsCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var bouquetImage: UIImageView!
  @IBOutlet weak var bouquetName: UILabel!
  @IBOutlet weak var bouquetPrice: UILabel!
  
  
  func setUpCell(image: UIImage, price: Double, imageName: String){
    bouquetImage.image = image
    bouquetPrice.text = "\(price) SAR"
    bouquetName.text = "\(imageName)"
  }
  
}
