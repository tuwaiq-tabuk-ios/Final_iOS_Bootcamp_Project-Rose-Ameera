//
//  SearchVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 30/01/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore


class SearchVC: UIViewController,
                UITableViewDelegate, UITableViewDataSource{
  
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var searchTable: UITableView!
  
  var searchResult: [MyBouquet] = []
  var filterSearch:[MyBouquet] = []
  
  private let ruseableID = String(describing: SearchCell.self)
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    searchTable.delegate = self
//    searchBar.delegate = self
    
    print("\n\n\n\n\n\n - - - searchResult.count \(searchResult.count)")
    
    let nib = UINib(nibName: ruseableID, bundle: nil)
    searchTable.register(nib, forCellReuseIdentifier: ruseableID)
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    getFlower("Bouquets")
    getFlower("Flowers")
  }
  
  // MARK: - Table view data source
  
  func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    print("\n\n\n\n\n\n - - - searchResult.count \(filterSearch.count)")
    return filterSearch.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ruseableID, for: indexPath) as! SearchCell
    
    cell.name.text = filterSearch[indexPath.row].name
    cell.price.text = " \(filterSearch[indexPath.row].price)"
    // Configure the cell...
    
    return cell
  }
  
  
  
  
  
  func getFlower(_ name: String){
    let db = Firestore.firestore()
    //  let userID = Auth.auth().currentUser?.uid
    db.collection(name).getDocuments { Snapshot, error in
      if error != nil {
        print(error!)
      }else{
        let data = Snapshot!.documents
        //    guard let data = Snapshot?.documents else {return}
        for document in data {
          let image = document.get("imageURL") as! String
          let name = document.get("name") as! String
          let price = document.get("price") as! Double
          let search = MyBouquet(image: image, price: price, name: name)
          self.searchResult.append(search)
        }
        self.searchTable.reloadData()
      }
    }
  }
}

extension SearchVC: UISearchBarDelegate{
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    guard let text = searchBar.text else {return}

    filterSearch = searchResult.filter({ item in
      item.name.lowercased().contains(text.lowercased())
    })
    self.searchTable.reloadData()
    
    
  }
}
