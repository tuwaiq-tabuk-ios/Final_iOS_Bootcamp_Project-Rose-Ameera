//
//  LoginVC.swift
//  firebase
//
//  Created by Ameera BA on 12/12/2021.
//

import UIKit

class LoginVC: UIViewController{
  
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var logInButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  
  public var vc = UIViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpElements()
  }
  
  
  func setUpElements(){
    errorLabel.alpha = 0
    Utilties.styleTextField(emailTextField)
    Utilties.styleTextField(passwordTextField)
    Utilties.styleFilldButton(logInButton)
  }
  
  
  @IBAction func logInPressed(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileTable") as! UserProfileTable
    self.navigationController?.pushViewController(controller, animated: true)
    
  }
  
  
  @IBAction func forgetPasswordbutton(_ sender: UIButton) {
  }
}
