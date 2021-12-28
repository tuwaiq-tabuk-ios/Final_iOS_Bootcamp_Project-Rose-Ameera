//
//  ShopCardVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 22/12/2021.
//

import UIKit


class ShopCardVC: UIViewController,
                  UITableViewDelegate,
                  UITableViewDataSource{
    
  
  @IBOutlet weak var shopCardTable: UITableView!
  
  var item = ["A", "B"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    shopCardTable.delegate = self
    shopCardTable.dataSource = self
    
//    self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)

  }
  
  
  @IBAction func doneShopCartPage(_ sender: UIButton) {
//    self.view.removeFromSuperview()
  }
  
  
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return item.count
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath)
    cell.textLabel?.text = item[indexPath.row]
    return cell
  }
}
