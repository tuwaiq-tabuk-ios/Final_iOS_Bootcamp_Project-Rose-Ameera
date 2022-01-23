//
//  FirstScreenCell.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 25/12/2021.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore


class UserProfileScreen: UIViewController {
  
  
  
  @IBOutlet weak var firstNameUserProfile: UITextField!
  @IBOutlet weak var lastNameUserProfile: UITextField!
  @IBOutlet weak var emailUserProfile: UITextField!
  @IBOutlet weak var passwordUserProfile: UITextField!
  @IBOutlet weak var upDateButton: UIButton!
  @IBOutlet weak var logOutButton: UIButton!
  
  let login = LoginVC()
  let db = Firestore.firestore()
  var firstName : String = ""
  var lastName : String = ""
  var email: String = ""
  var password : String = ""
  var iconClick = false
  var imageicone = UIImageView()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    Utilities.styleTextField(firstNameUserProfile)
    Utilities.styleTextField(lastNameUserProfile)
    Utilities.styleTextField(emailUserProfile)
    Utilities.styleTextField(passwordUserProfile)
    style()
    
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
    passwordUserProfile.rightView = contentView
    passwordUserProfile.rightViewMode = .always
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
      passwordUserProfile.isSecureTextEntry = false
    }
    else {
      iconClick = true
      tappedImage.image = UIImage(named: "hideeye")
      passwordUserProfile.isSecureTextEntry = true
    }
  }
  
  
  func style(){
    upDateButton.layer.borderWidth = 1
    upDateButton.layer.borderColor = UIColor.cmMainColor.cgColor
    upDateButton.layer.cornerRadius = 20
    logOutButton.layer.borderWidth = 1
    logOutButton.layer.borderColor = UIColor.cmMainColor.cgColor
    logOutButton.layer.cornerRadius = 20
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    let user = Auth.auth().currentUser
    print(user?.uid)
    if let currentUser = user {
      db.collection("users").document(currentUser.uid).getDocument { doc , err in
        if err != nil {
          print(err!)
        }
        else{
          let data = doc!.data()!
          
          self.firstName = data["firstname"] as! String
          self.lastName = data["lastname"] as! String
          self.email = (user?.email)!
          self.password = data["password"] as! String
          
          self.firstNameUserProfile.text = self.firstName
          self.lastNameUserProfile.text = self.lastName
          self.emailUserProfile.text = self.email
          self.passwordUserProfile.text = self.password
        }
      }
    }
  }
  
  
  @IBAction func logOutPressed(_ sender: UIButton) {
    do{
      try Auth.auth().signOut()
      dismiss(animated: true, completion: nil)
    } catch let sginOutError as NSError {
      print("Error signing out: %@", sginOutError)
    }
  }
  
  //not work
  @IBAction func updataButtonPressed(_ sender: UIButton) {
    Auth.auth().currentUser?.updateEmail(to: emailUserProfile.text!) { [self] error in
      if error == nil{
        let ref = db.collection("users").document(Auth.auth().currentUser!.uid)
        ref.updateData(["Email":emailUserProfile.text!
                        ,"firstname":firstNameUserProfile.text!
                        ,"lastname": lastNameUserProfile.text!]) { err in
          if let err = err {
            print("Error updating document: \(err)")
          } else {
            let alert = Service.createAleartController(title: ""
                                                       , message:"Your profile updated")
            self.present(alert,animated: true , completion: nil)
            print("Document successfully updated")
          }
        }
      }
    }
  }
}

