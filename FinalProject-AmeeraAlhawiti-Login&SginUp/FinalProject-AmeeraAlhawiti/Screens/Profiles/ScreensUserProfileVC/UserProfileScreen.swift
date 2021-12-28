//
//  FirstScreenCell.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 25/12/2021.
//

import UIKit

class UserProfileScreen: UIViewController {
  
  @IBOutlet weak var firstNameUserProfile: UITextField!
  @IBOutlet weak var lastNameUserProfile: UITextField!
  @IBOutlet weak var emailUserProfile: UITextField!
  @IBOutlet weak var passwordUserProfile: UITextField!
  @IBOutlet weak var dateBirthUserProfile: UITextField!
  
  // add date Picker to date birth text field
  var datePicker = UIDatePicker()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Utilities.styleTextField(firstNameUserProfile)
    Utilities.styleTextField(lastNameUserProfile)
    Utilities.styleTextField(emailUserProfile)
    Utilities.styleTextField(passwordUserProfile)
    Utilities.styleTextField(dateBirthUserProfile)

    
    // date Picker actions
    datePicker.datePickerMode = .date
    datePicker.preferredDatePickerStyle = .wheels
    datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    // for dissapear date picker
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
    view.addGestureRecognizer(tapGesture)
    
    dateBirthUserProfile.inputView = datePicker
    
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
}
