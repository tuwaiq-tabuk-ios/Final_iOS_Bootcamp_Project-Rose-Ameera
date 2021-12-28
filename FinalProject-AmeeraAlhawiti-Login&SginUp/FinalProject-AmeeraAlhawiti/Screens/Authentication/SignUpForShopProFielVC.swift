//
//  signupVC.swift
//  firebase
//
//  Created by Ameera BA on 12/12/2021.
//

import UIKit

class SignUpForShopProFielVC: UIViewController {
  
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
    Utilities.styleTextField(firstNameTextField)
    Utilities.styleTextField(lastNameTextField)
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleTextField(shopNameTextField)
    Utilities.styleTextField(cityNameTextField)
    Utilities.styleFilldButton(sginUpButton)
   

  }
  
  @IBAction func sginUpPressed(_ sender: UIButton) {
    print(#function)

    }
    
    
  }
  

