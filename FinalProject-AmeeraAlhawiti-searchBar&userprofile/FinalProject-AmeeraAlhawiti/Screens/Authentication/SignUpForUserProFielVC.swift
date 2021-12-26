//
//  SignUpForUserProFielVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 20/12/2021.
//

import UIKit

class SignUpForUserProFielVC:UIViewController {
  
  @IBOutlet weak var firstName: UITextField!
  @IBOutlet weak var lastName: UITextField!
  @IBOutlet weak var emailTextField2: UITextField!
  @IBOutlet weak var passwordTextField2: UITextField!
  @IBOutlet weak var sginupForUserProfile: UIButton!
  @IBOutlet weak var errorForUserProfile: UILabel!
  
  public var vc = UIViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUPElements()
  }
  
  
  func setUPElements(){
    errorForUserProfile.alpha = 0
    Utilties.styleTextField(firstName)
    Utilties.styleTextField(lastName)
    Utilties.styleTextField(emailTextField2)
    Utilties.styleTextField(passwordTextField2)
    Utilties.styleFilldButton(sginupForUserProfile)
  }
  
  
  @IBAction func sginUpPressed(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileTable") as! UserProfileTable
    self.navigationController?.pushViewController(controller, animated: true)
  }
}
