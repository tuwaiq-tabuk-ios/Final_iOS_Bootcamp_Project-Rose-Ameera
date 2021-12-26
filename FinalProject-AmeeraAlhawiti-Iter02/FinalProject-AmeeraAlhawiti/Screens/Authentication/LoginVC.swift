//
//  LoginVC.swift
//  firebase
//
//  Created by Ameera BA on 12/12/2021.
//

import Foundation
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
    print(#function)
  
  }
  
  
  @IBAction func forgetPasswordbutton(_ sender: UIButton) {
    

  }
  
}
