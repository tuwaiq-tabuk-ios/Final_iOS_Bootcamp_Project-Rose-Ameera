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
    //    viewSginUp.backgroundColor = UIColor.cmPink
    self.view.removeFromSuperview()
  }
  
  
  @IBAction func customerCarePressed(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "PopupScreen") as! CustmerCarePopupVC
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
  @IBAction func aboutUsPressed(_ sender: UIButton) {
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
  
  @IBAction func changeLangugePressed(_ sender: UIButton) {
    
    let alertDone = UIAlertController(title: "Change the language!".Localizable(),
                                      message: "Must restart to activate".Localizable(),
                                      preferredStyle: .alert)
    
    // Create the actions
    let okAction = UIAlertAction(title: "OK".Localizable(),
                                 style: UIAlertAction.Style.default){
      UIAlertAction in
      NSLog("OK Pressed")
      let currentLang = Locale.current.languageCode
      let newLanguage = currentLang == "en" ? "ar" : "en"
      UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
      exit(0)
    }
    let cancelAction = UIAlertAction(title: "NO".Localizable(), style: .cancel) {
      UIAlertAction in
      NSLog("Cancel Pressed")
      return
    }
    // Add the actions
    alertDone.addAction(okAction)
    alertDone.addAction(cancelAction)
    // Present the alert
    present(alertDone, animated: true, completion: nil)
//    alertDone.view.tintColor = .systemRed
//    alertDone.view.backgroundColor = .systemRed
  }
}
