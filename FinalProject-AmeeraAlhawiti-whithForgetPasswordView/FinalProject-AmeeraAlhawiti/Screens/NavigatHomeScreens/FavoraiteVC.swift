//
//  FavoraiteVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 06/01/2022.
//

import UIKit

class FavoraiteVC: UIViewController,
                   UITableViewDelegate,
                   UITableViewDataSource {

  
  
  
  @IBOutlet weak var favoraiteTable: UITableView!
  
  
  var item = [ProductsForFavoraite(image: UIImage(named: "flower2")!, name: "Flower1", price: 20)]

    override func viewDidLoad() {
        super.viewDidLoad()

      favoraiteTable.delegate = self
      favoraiteTable.dataSource = self
      
        // Do any additional setup after loading the view.
    }
    

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return item.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
  //  let cell = tableView.dequeueReusableCell(withIdentifier: "FavoraiteTableCell") as! FavoraiteTableCell
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "FavoraiteTableCell") as! FavoraiteTableCell
    
    let data = item[indexPath.row]
    cell.setUpFavoraiteCell(photo: data.image, nameLabel: data.name, priceLabel: data.price)
    return cell
  }
  
  
 
}


struct ProductsForFavoraite {
  let image: UIImage
  let name: String
  let price: Double
}
