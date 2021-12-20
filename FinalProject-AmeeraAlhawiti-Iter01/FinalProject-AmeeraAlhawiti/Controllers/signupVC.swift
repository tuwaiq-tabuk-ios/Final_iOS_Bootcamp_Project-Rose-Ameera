//
//  signupVC.swift
//  firebase
//
//  Created by Ameera BA on 12/12/2021.
//

import Foundation
import UIKit

class SignUpVC: UIViewController {
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var shopNameTextField: UITextField!
  @IBOutlet weak var cityNameTextField: UITextField!
  
  
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var sginUpButton: UIButton!
  
 
  
  public var vc = UIViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUPElements()
  }
  
  
  func setUPElements(){
    errorLabel.alpha = 0
    Utilties.styleTextField(firstNameTextField)
    Utilties.styleTextField(lastNameTextField)
    Utilties.styleTextField(emailTextField)
    Utilties.styleTextField(passwordTextField)
    Utilties.styleTextField(shopNameTextField)
    Utilties.styleTextField(cityNameTextField)
    Utilties.styleFilldButton(sginUpButton)
   

  }
  
  @IBAction func sginUpPressed(_ sender: UIButton) {
    print(#function)

    }
    
    
  }
  

