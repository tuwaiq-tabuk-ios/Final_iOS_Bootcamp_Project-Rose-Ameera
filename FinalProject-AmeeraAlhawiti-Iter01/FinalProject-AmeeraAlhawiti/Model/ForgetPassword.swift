//
//  Forget_Password.swift
//  ProtoType_cookRec
//
//  Created by Aisha Ali on 11/21/21.
//

import UIKit

class ForgetPassword:UIViewController{
  
  public var vc = UIViewController()
    
  @IBOutlet weak var forgetPasswordButton: UIButton!
    
  @IBOutlet weak var sendEmail: UITextField!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Utilties.styleFilldButton(forgetPasswordButton)
    Utilties.styleTextField(sendEmail)
  }
  
  @IBAction func button_pressed(_ sender: UIButton) {
   
  }
}
