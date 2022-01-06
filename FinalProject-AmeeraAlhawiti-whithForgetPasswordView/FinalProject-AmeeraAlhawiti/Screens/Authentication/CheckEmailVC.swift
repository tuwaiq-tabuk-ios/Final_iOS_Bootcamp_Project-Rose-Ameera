//
//  CheckEmailVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 06/01/2022.
//

import UIKit

class CheckEmailVC: UIViewController {


  @IBOutlet weak var backButton: UIButton!
  
    var vc = UIViewController()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      Utilities.styleFilldButton(backButton)
    }
    
  @IBAction func backButtonPressed(_ sender: UIButton) {
    vc = storyboard?.instantiateViewController(withIdentifier:"OnboardingVC" ) as! OnboardingVC
    vc.modalPresentationStyle = .fullScreen
    present(vc,animated: false, completion: nil)
  }
}
