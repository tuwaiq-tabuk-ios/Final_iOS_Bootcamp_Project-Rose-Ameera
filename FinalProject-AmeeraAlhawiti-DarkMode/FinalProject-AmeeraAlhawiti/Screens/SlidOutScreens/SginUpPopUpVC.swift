//
//  SettingClass.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 16/12/2021.
//

import UIKit


class SginUpPopUpVC: UIViewController {
  
  @IBOutlet weak var viewSginUp: UIView!
  @IBOutlet weak var SginInORSginUpButton: UIButton!


  override func viewDidLoad() {
    super.viewDidLoad()
//    self.view.backgroundColor = UIColor.white.withAlphaComponent(1.0)

    viewSginUp.layer.cornerRadius = 30
//    viewSginUp.backgroundColor = UIColor.gray
  }
  
  @IBAction func doneSginin(_ sender: UIButton) {
    self.view.removeFromSuperview()
  }
  
  
  
}


 
