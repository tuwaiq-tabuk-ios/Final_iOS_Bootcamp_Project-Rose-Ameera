//
//  SignUpForUserProFielVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 20/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase


class SignUpForUserProFielVC:UIViewController {
  
  @IBOutlet weak var firstName: UITextField!
  @IBOutlet weak var lastName: UITextField!
  @IBOutlet weak var emailTextField2: UITextField!
  @IBOutlet weak var passwordTextField2: UITextField!
  @IBOutlet weak var sginupForUserProfile: UIButton!
  @IBOutlet weak var errorForUserProfile: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUPElements()
  }
  
  
  func setUPElements(){
    errorForUserProfile.alpha = 0
    Utilities.styleTextField(firstName)
    Utilities.styleTextField(lastName)
    Utilities.styleTextField(emailTextField2)
    Utilities.styleTextField(passwordTextField2)
    Utilities.styleFilldButton(sginupForUserProfile)
  }
  
  
  func validateFields() -> String? {
      
      // Check that all fields are filled in
      if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
          lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
          emailTextField2.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
          passwordTextField2.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
          
          return "Please fill in all fields."
      }
      
      // Check if the password is secure
      let cleanedPassword = passwordTextField2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
      if Utilities.isPasswordValid(cleanedPassword) == false {
          // Password isn't secure enough
          return "Please make sure your password is at least 8 characters, contains a special character and a number."
      }
      
      return nil
  }
  
  
  @IBAction func sginUpPressed(_ sender: UIButton) {
   
   
    // Validate the fields
    let error = validateFields()
    
    if error != nil {
      
      // There's something wrong with the fields, show error message
      showError(error!)
    }
    else {
      
      // Create cleaned versions of the data
      let firstName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let lastName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let email = emailTextField2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let password = passwordTextField2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
      // Create the user
      Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
        
        // Check for errors
        if err != nil {
          
          // There was an error creating the user
          self.showError("Error creating user")
        }
        else {
          
          // User was created successfully, now store the first name and last name
          let db = Firestore.firestore()
          
          db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
            
            if error != nil {
              // Show error message
              self.showError("Error saving user data")
            }
          }
          
          // Transition to the home screen
          self.transitionToHome()
        }
        
      }
    }
  }
  
  
  func showError(_ message:String) {
      
    errorForUserProfile.text = message
    errorForUserProfile.alpha = 1
  }
  
  func transitionToHome() {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileTable") as! UserProfileTable
        self.navigationController?.pushViewController(controller, animated: true)
  }
  
}
