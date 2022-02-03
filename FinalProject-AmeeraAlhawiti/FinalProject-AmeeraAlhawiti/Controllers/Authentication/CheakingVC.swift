import UIKit
import Firebase

class CheakingVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let storyboard = UIStoryboard(name: "Main",
                                  bundle: nil)
    
    print("user id : \(Auth.auth().currentUser?.uid)")
    if Auth.auth().currentUser?.uid != nil {
      
      let vc = storyboard.instantiateViewController(withIdentifier: "Nanigate") as! Nanigate
      vc.modalPresentationStyle = .fullScreen
      self.present(vc, animated: true, completion: nil)
    }
    else{
      let vc = storyboard.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingVC
      vc.modalPresentationStyle = .fullScreen
      self.present(vc, animated: true, completion: nil)
    }
  }
}
