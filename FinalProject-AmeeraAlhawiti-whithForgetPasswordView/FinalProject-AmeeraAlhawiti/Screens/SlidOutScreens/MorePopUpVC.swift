//
//  SettingClass.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 16/12/2021.
//

import UIKit


class MorePopUpVC: UIViewController {
  
  @IBOutlet weak var viewSginUp: UIView!

  
  @IBOutlet weak var addressButton: UIButton!
  @IBOutlet weak var userProfileButton: UIButton!
  @IBOutlet weak var customerCareButton: UIButton!
  @IBOutlet weak var aboutUsButton: UIButton!


  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.white.withAlphaComponent(0.3)

    viewSginUp.layer.cornerRadius = 30
    viewSginUp.backgroundColor = UIColor.cmWhite
    self.view.removeFromSuperview()
  }
  
  
  @IBAction func customerCarePressed(_ sender: UIButton) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "PopupScreen") as! CustmerCarePopupVC
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
  @IBAction func aboutUsPressed(_ sender: UIButton) {
    //    vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsPage") as! AboutUsPageVC
    //    present(vc,animated: false, completion: nil)
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "AboutUsPage") as! AboutUsPageVC
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
  @IBAction func userProfilePressed(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileScreen") as! UserProfileScreen
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
  @IBAction func addressButtonPressed(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileAddress") as! UserProfileAddress
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
}


 
