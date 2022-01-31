//
//  BouquetsCollectionCell.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 15/12/2021.
//

import UIKit

class ScrollBouquetsCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var bouquetsCell: UIImageView!
  @IBOutlet weak var nameOfBouquetLabel: UILabel!
  @IBOutlet weak var priceOfScrollBouquet: UILabel!


  func setUpCell(image: UIImage, price: Double, imageName: String){
    bouquetsCell.image = image
    priceOfScrollBouquet.text = "\(price) SAR"
    nameOfBouquetLabel.text = "\(imageName)"
  }
}
