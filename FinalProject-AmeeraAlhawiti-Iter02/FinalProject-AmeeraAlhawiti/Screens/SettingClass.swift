//
//  SettingClass.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 16/12/2021.
//

import UIKit


class SettingClass: UIViewController {
  
  @IBOutlet weak var SginInORSginUpButton: UIButton!
  @IBOutlet weak var customerCareButton: UIButton!
  @IBOutlet weak var aboutUsButton: UIButton!
  
  public var vc = UIViewController()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    customerCareButton.layer.borderColor = UIColor.gray.cgColor
    customerCareButton.layer.borderWidth = 1
    customerCareButton.layer.cornerRadius = 15
    aboutUsButton.layer.borderColor = UIColor.gray.cgColor
    aboutUsButton.layer.borderWidth = 1
    aboutUsButton.layer.cornerRadius = 15
    
//    aboutUsButton.addTarget(self, action: #selector(showAboutUsPopup), for: .touchUpInside)
  }
  
  
  @IBAction func customerCarePressed(_ sender: UIButton) {
    
    let popOverVC =
    UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupScreen") as! PopupVC
    self.addChild(popOverVC)
    popOverVC.view.frame = self.view.frame
    self.view.addSubview(popOverVC.view)
    popOverVC.didMove(toParent: self)
    
  }
  
  
  @IBAction func aboutUsPressed(_ sender: UIButton) {
    
    vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsPage") as! AboutUsPage
    //vc.modalPresentationStyle = .fullScreen
    present(vc,animated: false, completion: nil)
  }
  
  
  
}


 
