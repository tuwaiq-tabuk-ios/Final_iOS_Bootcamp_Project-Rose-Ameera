//
//  FavoraiteTableCell.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 06/01/2022.
//

import UIKit

class FavoraiteTableCell: UITableViewCell {

  
  @IBOutlet weak var photoView: UIImageView!
  @IBOutlet weak var nameLable: UILabel!
  @IBOutlet weak var priceLable: UILabel!
  
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
  func setUpFavoraiteCell(photo: UIImage, nameLabel: String, priceLabel: Double) {
    
    photoView.image = photo
    nameLable.text = nameLabel
    priceLable.text = "\(priceLabel) SAR"
    
  }
  
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
