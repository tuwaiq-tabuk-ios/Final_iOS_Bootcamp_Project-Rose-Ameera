//
//  Localization+Ext.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 26/01/2022.
//

import UIKit


extension String{
  func Localizable()-> String{
    return NSLocalizedString(self,
                             tableName: "Localizable",
                             bundle: .main,
                             value: self,
                             comment: self)
  }
}
