//
//  PopupVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 22/12/2021.
//

import UIKit
import MessageUI

class CustmerCarePopupVC: UIViewController,
                          MFMailComposeViewControllerDelegate {
  
  @IBOutlet weak var contactView: UIView!
  @IBOutlet weak var questionImage: UIImageView!
  
  
  var phone = "0552637882"
  let urlWhats = "https://wa.me/966552637882"
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    contactView.layer.cornerRadius = 30
    contactView.layer.borderColor = UIColor.cmPink.cgColor
    contactView.layer.borderWidth = 1
    questionImage.layer.cornerRadius = 20
  }
  
  
  @IBAction func phonCallPressed(_ sender: UIButton) {
    guard let number = URL(string: "tel://" + (self.phone ) ) else { return }
    UIApplication.shared.open(number)
    print("Install Call")
  }
  
  
  @IBAction func whatsappPressed(_ sender: UIButton) {
    if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
      if let whatsappURL = URL(string: urlString) {
        if UIApplication.shared.canOpenURL(whatsappURL){
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(whatsappURL, options: [:],
                                      completionHandler: nil)
          } else {
            UIApplication.shared.openURL(whatsappURL)
          }
        }
        else {
          print("Install Whatsapp")
        }
      }
    }
  }
}
