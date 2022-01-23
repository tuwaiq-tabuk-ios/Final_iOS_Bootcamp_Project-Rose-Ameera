//
//  Service.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 06/01/2022.
//

import UIKit

class Service{
  
  static func createAleartController(title : String
                                     , message: String) -> UIAlertController{
    
    let alert = UIAlertController(title: title
                                  , message: message
                                  , preferredStyle: .alert)
    
    let okAction  = UIAlertAction(title: "Ok"
                                  , style: .default)
    {(action) in
      alert.dismiss(animated: true
                    , completion: nil)
    }
    alert.addAction(okAction)
    return alert
  }
}
