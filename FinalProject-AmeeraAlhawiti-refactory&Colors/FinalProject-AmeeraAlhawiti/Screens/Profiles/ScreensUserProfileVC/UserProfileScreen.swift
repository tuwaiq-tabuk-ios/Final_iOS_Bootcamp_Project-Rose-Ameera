//
//  FirstScreenCell.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 25/12/2021.
//

import UIKit
import Firebase

class UserProfileScreen: UIViewController {
  
  let login = LoginVC()
  
  @IBOutlet weak var firstNameUserProfile: UITextField!
  @IBOutlet weak var lastNameUserProfile: UITextField!
  @IBOutlet weak var emailUserProfile: UITextField!
  @IBOutlet weak var passwordUserProfile: UITextField!
  @IBOutlet weak var dateBirthUserProfile: UITextField!
  
  // add date Picker to date birth text field
  var datePicker = UIDatePicker()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // date Picker actions
    datePicker.datePickerMode = .date
    datePicker.preferredDatePickerStyle = .wheels
    datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    // for dissapear date picker
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
    view.addGestureRecognizer(tapGesture)
    
    dateBirthUserProfile.inputView = datePicker
    
    
  // MARK: - display the user info in the text field
      Auth.auth().addStateDidChangeListener { auth, user in
      if Auth.auth().currentUser != nil {
        let email = user?.email
        print("\n\n#####EMAIL: \(String(describing: email))")
        self.emailUserProfile.text = email!
        
        //////////
        let uid = user?.uid
        print("\n\n#####uid: \(String(describing: uid))")
        
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments() { (querySnapshot, err) in
          if let err = err {
            print("Error getting documents: \(err)")
          } else {
         for document in querySnapshot!.documents {
              
         print("\(document.documentID) => \(document.data())")
              
        print("\n\n********\(String(describing: document.data()["firstname"]))")
         self.firstNameUserProfile.text = "\(document["firstname"]!)"
              
              
          print("\n\n********\(String(describing: document.data()["lastname"]))")
          self.lastNameUserProfile.text = "\(document["lastname"]!)"
              
            }
          }
        }
      }
    }
    
    
  }
  
  
  @objc func viewTapped(_ gestureRecognizer: UITapGestureRecognizer){
    view.endEditing(true)
  }
  
  
  @objc func dateChanged(_ datePicker: UIDatePicker) {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    
    dateBirthUserProfile.text = dateFormatter.string(from: datePicker.date)
    view.endEditing(true)
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
