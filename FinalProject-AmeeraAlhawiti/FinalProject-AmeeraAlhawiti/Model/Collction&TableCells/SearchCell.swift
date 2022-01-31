//
//  SearchCell.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 30/01/2022.
//

import UIKit

class SearchCell: UITableViewCell {
  
  
  @IBOutlet weak var myImage: UIImageView!
  @IBOutlet weak var price: UILabel!
  @IBOutlet weak var name: UILabel!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool,
                              animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
