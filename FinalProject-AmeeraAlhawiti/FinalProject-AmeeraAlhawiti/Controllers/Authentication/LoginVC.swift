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
  
  var iconClick = false
  var imageicone = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpElements()
    
    // MARK: - for handel password
    imageicone.image = UIImage(named: "hideeye")
    let contentView = UIView()
    contentView.addSubview(imageicone)
    contentView.frame = CGRect(x: 0, y: 0,
                               width: 30,
                               height: 30)
    contentView.tintColor = .cmPink
    imageicone.frame = CGRect(x: -10, y: 0,
                              width: 30,
                              height: 30)
    imageicone.tintColor = .black
    passwordTextField.rightView = contentView
    passwordTextField.rightViewMode = .always
    let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                      action: #selector(imageTapped(tapGestureRecognizer:)))
    imageicone.isUserInteractionEnabled = true
    imageicone.addGestureRecognizer(tapGestureRecognizer)
  }
  
  // tap Gesture Recognizer selector
  @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
    let tappedImage = tapGestureRecognizer.view as! UIImageView
    if iconClick {
      iconClick = false
      tappedImage.image = UIImage(named: "openeye")
      passwordTextField.isSecureTextEntry = false
    }
    else {
      iconClick = true
      tappedImage.image = UIImage(named: "hideeye")
      passwordTextField.isSecureTextEntry = true
    }
  }
  
  // textfield and button style
  func setUpElements(){
    errorLabel.alpha = 0
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleFilldButton(logInButton)
  }
  
  @IBAction func LogInPressed(_ sender: UIButton) {
    
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
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(controller, animated: true)
        
      }
    }
  }
  
  @IBAction func creatAcountButtonPressed(_ sender: UIButton) {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let controller = storyboard.instantiateViewController(withIdentifier: "SignUpForUserProFielVC") as!SignUpForUserProFielVC
//    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  @IBAction func forgetPasswordbutton(_ sender: UIButton) {
    
  }
  
  //MARK: - hidden password
  
  
}
