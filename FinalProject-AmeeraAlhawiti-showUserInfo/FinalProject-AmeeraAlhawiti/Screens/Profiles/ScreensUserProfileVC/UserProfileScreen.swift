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
  
  let login = LoginVC()
  let db = Firestore.firestore()
  
  @IBOutlet weak var firstNameUserProfile: UITextField!
  @IBOutlet weak var lastNameUserProfile: UITextField!
  @IBOutlet weak var emailUserProfile: UITextField!
  @IBOutlet weak var passwordUserProfile: UITextField!

  @IBOutlet weak var upDateButton: UIButton!
  @IBOutlet weak var logOutButton: UIButton!
  
  
  var firstName : String = ""
   var lastName : String = ""
   var email: String = ""
  var password : String = ""

  
  
  // add date Picker to date birth text field
  var datePicker = UIDatePicker()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    Utilities.styleTextField(firstNameUserProfile)
    Utilities.styleTextField(lastNameUserProfile)
    Utilities.styleTextField(emailUserProfile)
    Utilities.styleTextField(passwordUserProfile)
    upDateButton.layer.borderWidth = 1
    upDateButton.layer.borderColor = UIColor.cmRed.cgColor
    upDateButton.layer.cornerRadius = 20
    logOutButton.layer.borderWidth = 1
    logOutButton.layer.borderColor = UIColor.cmRed.cgColor
    logOutButton.layer.cornerRadius = 20
    
    // date Picker actions
//    datePicker.datePickerMode = .date
//    datePicker.preferredDatePickerStyle = .wheels
//    datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
//    // for dissapear date picker
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
//    view.addGestureRecognizer(tapGesture)
//
//    dateBirthUserProfile.inputView = datePicker
//
    
  // MARK: - display the user info in the text field
//      Auth.auth().addStateDidChangeListener { auth, user in
//      if Auth.auth().currentUser != nil {
//        let email = user?.email
//        print("\n\n#####EMAIL: \(String(describing: email))")
//        self.emailUserProfile.text = email!
        
       
        
        //////////
//        let uid = user?.uid
//        print("\n\n#####uid: \(String(describing: uid))")
        
//        let db = Firestore.firestore()
        
//        db.collection("users").getDocuments() { (querySnapshot, err) in
//          if let err = err {
//            print("Error getting documents: \(err)")
//          } else {
//         for document in querySnapshot!.documents {
//
//         print("\(document.documentID) => \(document.data())")
//
//        print("\n\n********\(String(describing: document.data()["firstname"]))")
//         self.firstNameUserProfile.text = "\(document["firstname"]!)"
//
//
//          print("\n\n********\(String(describing: document.data()["lastname"]))")
//          self.lastNameUserProfile.text = "\(document["lastname"]!)"
//
//            }
//          }
//        }
        
//      }
//    }
  }
  
  
//  @objc func viewTapped(_ gestureRecognizer: UITapGestureRecognizer){
//    view.endEditing(true)
//  }
//
//
//  @objc func dateChanged(_ datePicker: UIDatePicker) {
//
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MM/dd/yyyy"
//
//    dateBirthUserProfile.text = dateFormatter.string(from: datePicker.date)
//    view.endEditing(true)
//  }
  
  
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
     //  print(“**********DATA : \(data)“)
        
        
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

}
