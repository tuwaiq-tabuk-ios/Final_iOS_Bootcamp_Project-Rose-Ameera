//
//  Forget_Password.swift
//  ProtoType_cookRec
//
//  Created by Aisha Ali on 11/21/21.
//

import UIKit
import FirebaseAuth

class ForgetPassword:UIViewController{
  
  public var vc = UIViewController()
    
  @IBOutlet weak var sendButton: UIButton!
  @IBOutlet weak var sendEmail: UITextField!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    view.backgroundColor = UIColor.cmWhite
    
    Utilities.styleFilldButton(sendButton)
    Utilities.styleTextField(sendEmail)
  }
  
 
  @IBAction func sendButtonPressed(_ sender: UIButton) {
    
    let auth = Auth.auth()
    auth.sendPasswordReset(withEmail: sendEmail.text!) { [self] (error) in
      if let error = error {
        let alert =  Service.createAleartController(title: "Error", message: error.localizedDescription)
        self.present(alert,animated: true , completion:  nil)
        return
      }
      else {
        self.vc = self.storyboard?.instantiateViewController(withIdentifier:"CheckEmailVC") as! CheckEmailVC
        self.vc.modalPresentationStyle = .fullScreen
        present(vc,animated: false, completion: nil)
      }
    }
  }
}
