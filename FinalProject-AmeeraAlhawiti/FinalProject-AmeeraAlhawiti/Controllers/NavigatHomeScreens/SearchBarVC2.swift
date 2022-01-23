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
  
  
//  var searchController: UISearchController!
//  var originalDataSourch: [String] = []
//  var currentDataSource: [String] = []
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//    view.backgroundColor = UIColor.cmWhite
//
//    searchTableView.delegate = self
//    searchTableView.dataSource = self
//    addProductToDataSource(productCount: 16, product: "Flower")
//    addProductToDataSource(productCount: 8, product: "Bouquet")
//
//    currentDataSource = originalDataSourch
//
//    searchController = UISearchController(searchResultsController: nil)
//  //  searchController.searchResultsUpdater = self
//    searchContainerView.addSubview(searchController.searchBar)
//    searchController.searchBar.delegate = self
//  }
  

  
  
//  func addProductToDataSource(productCount: Int, product: String){
//
//    for index in 1...productCount {
//      originalDataSourch.append("\(product) #\(index)")
//    }
//  }
//
//
//  func filterCurrentDateSource(searchTerm: String) {
//    if searchTerm.count > 0 {
//      currentDataSource = originalDataSourch
//      let filteredResults = currentDataSource.filter { $0.replacingOccurrences(of: "", with: "") .lowercased().contains(searchTerm.replacingOccurrences(of: "", with: "").lowercased())
//      }
//
//      currentDataSource = filteredResults
//      searchTableView.reloadData()
//    }
//  }
}
