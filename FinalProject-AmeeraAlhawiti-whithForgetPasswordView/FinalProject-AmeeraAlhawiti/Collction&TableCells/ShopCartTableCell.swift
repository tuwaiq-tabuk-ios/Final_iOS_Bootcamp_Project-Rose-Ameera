//
//  ShopCartCell.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 06/01/2022.
//

import UIKit

class ShopCartCell: UITableViewCell {
  
  
  @IBOutlet weak var imageCell: UIImageView!
  @IBOutlet weak var cellNameLabel: UILabel!
  @IBOutlet weak var cellPriceLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  
  func setUpCartCell(photo: UIImage, nameLabel: String, priceLabel: Double) {
    
    imageCell.image = photo
    cellNameLabel.text = nameLabel
    cellPriceLabel.text = "\(priceLabel) SAR"
    
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
