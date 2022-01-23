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
  @IBOutlet weak var continueButton: UIButton!
  
  
  var item = [Products(image: UIImage(named: "flower4")!, name: "flower3", price: 22.0)]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    shopCardTable.delegate = self
    shopCardTable.dataSource = self
    
    continueButton.layer.borderWidth = 2
    continueButton.layer.borderColor = UIColor.black.cgColor
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! ShopCartCell
    
    let data = item[indexPath.row]
    cell.setUpCartCell(photo: data.image,
                       nameLabel: data.name,
                       priceLabel: data.price)
    return cell
  }
  
  func tableView(_ tableView: UITableView,
                 heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  
  func tableView(_ tableView: UITableView,
                 trailingSwipeActionsConfigurationForRowAt indexPath:
                 IndexPath) -> UISwipeActionsConfiguration? {
    let deletAction = UIContextualAction(style: .destructive,
                                         title: "Delete") { action, view, completion in
     // self.deletData(name: self.arrForNames[indexPath.row])
      self.item.remove(at: indexPath.row)
      self.shopCardTable.reloadData()
      completion(true)
    }
    return UISwipeActionsConfiguration(actions: [deletAction])
  }

}

