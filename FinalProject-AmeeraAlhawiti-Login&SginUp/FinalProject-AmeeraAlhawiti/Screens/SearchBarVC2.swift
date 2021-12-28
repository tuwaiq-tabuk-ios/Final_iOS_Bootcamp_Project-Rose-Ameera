//
//  SearchBarVC2.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 27/12/2021.
//

import UIKit

class SearchBarVC2: UIViewController {
  
  
  @IBOutlet weak var searchContainerView: UIView!
  @IBOutlet weak var searchTableView: UITableView!
  
  
  var searchController: UISearchController!
  var originalDataSourch: [String] = []
  var currentDataSource: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
      
      searchTableView.delegate = self
      searchTableView.dataSource = self
      
      addProductToDataSource(productCount: 16, product: "Flower")
      addProductToDataSource(productCount: 8, product: "Bouquet")
      
      currentDataSource = originalDataSourch

      searchController = UISearchController(searchResultsController: nil)
      searchController.searchResultsUpdater = self
      //searchController.obscuresBackgroundDuringPresentation = false
      searchContainerView.addSubview(searchController.searchBar)
      searchController.searchBar.delegate = self
    }
    

  @IBAction func restorData(_ sender: UIButton) {
    restoreCurrentDataSource()
  }
  
  
  func addProductToDataSource(productCount: Int, product: String){
    
    for index in 1...productCount {
      originalDataSourch.append("\(product) #\(index)")
    }
  }
  
  
  func filterCurrentDateSource(searchTerm: String) {
    
    if searchTerm.count > 0 {
      currentDataSource = originalDataSourch
      
      let filteredResults = currentDataSource.filter { $0.replacingOccurrences(of: "", with: "") .lowercased().contains(searchTerm.replacingOccurrences(of: "", with: "").lowercased())
      }
      
      currentDataSource = filteredResults
      searchTableView.reloadData()
    }
  }
  
  
  func restoreCurrentDataSource(){
    currentDataSource = originalDataSourch
    searchTableView.reloadData()
  }
  
  
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
