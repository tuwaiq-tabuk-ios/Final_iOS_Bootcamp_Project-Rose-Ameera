//
//  LoginVC.swift
//  firebase
//
//  Created by Ameera BA on 12/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginVC: UIViewController{
  
  

  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var logInButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  
  
  public var vc = UIViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.cmWhite
    setUpElements()
    
  }
  
  
  func setUpElements(){
    errorLabel.alpha = 0
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleFilldButton(logInButton)
    
  }
  
  @IBAction func logInPressed(_ sender: UIButton) {
    
    // Create cleaned versions of the text field
    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    
    
    
    
    

        
    // Signing in the user
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      
      if error != nil {
        // Couldn't sign in
        self.errorLabel.text = error!.localizedDescription
        self.errorLabel.alpha = 1
      }
      else {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileTable") as! UserProfileTable
        self.navigationController?.pushViewController(controller, animated: true)
        
      }
    }
  }
  
  
  @IBAction func forgetPasswordbutton(_ sender: UIButton) {
    
  }
  
}
