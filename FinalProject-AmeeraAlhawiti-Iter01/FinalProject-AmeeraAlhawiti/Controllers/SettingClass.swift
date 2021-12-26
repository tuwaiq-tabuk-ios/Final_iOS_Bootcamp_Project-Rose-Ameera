//
//  SettingClass.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 16/12/2021.
//

import UIKit



class SettingClass: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  
  @IBOutlet weak var SginInORSginUpButton: UIButton!

  @IBOutlet weak var table: UITableView!
  
  var currentDescription: String = ""
  //var items = [Item(name: "About us", descripton: "AAA"),
   //            Item(name: "Customer care", descripton: "SSSS")]
  
  var items = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    table.layer.borderWidth = 0.5
    table.layer.borderColor = UIColor.black.cgColor
    table.layer.cornerRadius = 10
    
    table.dataSource = self
    table.delegate = self
  }
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
   
    return 2
  }
  
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1",
                                             for: indexPath)
    items.append("Customer care")
    items.append("About us")
    cell.textLabel?.text = "\(items[indexPath.row])"
    
    return cell
  }
}
