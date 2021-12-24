//
//  Custom.swift
//  firebase
//
//  Created by Ameera BA on 12/12/2021.
//
import UIKit

class Utilties {
  static func styleTextField ( _ textfield: UITextField){
    let bottomLine = CALayer()
    
    bottomLine.frame = CGRect (x: 0,
                               y: textfield.frame.height-2,
                               width: textfield.frame.width,
                               height: 2)

    bottomLine.backgroundColor = UIColor.black.cgColor
    // remove border on text feild
    textfield.borderStyle = .none
    // Add the line to the text field
    textfield.layer.addSublayer(bottomLine)
  }
  
  static func styleLabel ( _ label: UILabel){
    let bottomLine = CALayer()
    
    bottomLine.frame = CGRect (x: 0,
                               y: label.frame.height-2,
                               width: label.frame.width,
                               height: 2)

    bottomLine.backgroundColor = UIColor.black.cgColor
    // remove border on text feild
//    textfield.borderStyle = .none
    // Add the line to the text field
    label.layer.addSublayer(bottomLine)
  }
  
  
  static func styleFilldButton(_ button: UIButton){
    
    button.backgroundColor = UIColor.black
    button.layer.cornerRadius = 25
    button.tintColor = UIColor.white
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 1
  }
  
  
  static func styleHollowButton(_ button: UIButton){
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.cmBlue.cgColor
    button.layer.cornerRadius = 25
    button.tintColor = UIColor.black
  }
  
}
