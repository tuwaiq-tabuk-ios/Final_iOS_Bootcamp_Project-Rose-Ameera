//
//  OnboardingCollectionViewCell.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 02/01/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
  
  @IBOutlet weak var slideImageView: UIImageView!
  @IBOutlet weak var slideLable: UILabel!
  
  
  func setUp(_ slide: OnboardingSlide) {
    slideImageView.image = slide.image
    slideLable.text = slide.title
  }
}
