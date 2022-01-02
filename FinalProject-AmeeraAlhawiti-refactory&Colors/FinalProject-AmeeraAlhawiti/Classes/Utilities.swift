//
//  Custom.swift
//  firebase
//
//  Created by Ameera BA on 12/12/2021.
//
import UIKit

class Utilities {
  static func styleTextField ( _ textfield: UITextField){
    let bottomLine = CALayer()
    
    bottomLine.frame = CGRect (x: 0,
                               y: textfield.frame.height-2,
                               width: textfield.frame.width,
                               height: 2)

    bottomLine.backgroundColor = UIColor.cmPink.cgColor
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

    bottomLine.backgroundColor = UIColor.cmPink.cgColor
 
    // Add the line to the text field
    label.layer.addSublayer(bottomLine)
  }
  
  
  static func styleFilldButton(_ button: UIButton){
    
    button.backgroundColor = UIColor.cmPink
    button.tintColor = UIColor.black
    button.layer.borderColor = UIColor.gray.cgColor
    button.layer.borderWidth = 1
    button.layer.cornerRadius = 25
  }
  
  
  static func styleHollowButton(_ button: UIButton){
   
    
    let bottomLine = CALayer()
    
    bottomLine.frame = CGRect (x: 0,
                               y: button.frame.height-2,
                               width: button.frame.width,
                               height: 1)

    bottomLine.backgroundColor = UIColor.cmWhite.cgColor
 
    // Add the line to the text field
    button.layer.addSublayer(bottomLine)
  
    button.tintColor = UIColor.black
  }
  
  
  static func isPasswordValid(_ password : String) -> Bool {
      
      let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
      return passwordTest.evaluate(with: password)
  }
  
}
