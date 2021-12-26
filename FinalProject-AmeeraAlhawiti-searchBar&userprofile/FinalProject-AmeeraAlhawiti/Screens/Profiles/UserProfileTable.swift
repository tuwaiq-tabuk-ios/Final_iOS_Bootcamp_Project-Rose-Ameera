//
//  UserProfileTable.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 23/12/2021.
//

import UIKit

class UserProfileTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  //MARK: - Outlets
  @IBOutlet weak var profileTable: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    profileTable.delegate = self
    profileTable.dataSource = self
    
  }
  
  
  //MARK: - Functions
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.row == 0 {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as! FirstCustomTVCell
      
      return cell
    }
    else if indexPath.row == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! SecondCustomTVCell
      
      return cell
    }
    else if indexPath.row == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3") as! ThirdCustomTVCell
      
      return cell
    }
    else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4") as! ForthCostumTVCell
      
      return cell
    }
  }
  
  
  //MARK: - Actions
  @IBAction func canselButtonPressed(_ sender: UIBarButtonItem) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    self.navigationController?.pushViewController(controller, animated: true)
  }
}
