//
//  SearchBar+Ext.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 27/12/2021.
//

import UIKit

// for update result
//extension SearchBarVC2: UISearchResultsUpdating {
//
//  func updateSearchResults(for searchController: UISearchController) {
//    if let searchText = searchController.searchBar.text {
//      filterCurrentDateSource(searchTerm: searchText)
//    }
//  }
//}


// for delegat
//extension SearchBarVC2: UISearchBarDelegate {
//
//  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//    searchController.isActive = false
//
//    if let searchText = searchBar.text {
//      filterCurrentDateSource(searchTerm: searchText)
//    }
//  }
//
//
//  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//    searchController.isActive = false
//
//    if let searchText = searchBar.text , !searchText.isEmpty {
////      restoreCurrentDataSource()
//    }
//  }
//}


// for appear result in table view

//extension SearchBarVC2: UITableViewDelegate, UITableViewDataSource {
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return currentDataSource.count
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//    cell.textLabel?.text = currentDataSource[indexPath.row]
//    return cell
//  }
  
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    let alertController = UIAlertController(title: "Selection",
//                                            message: "Selected: \(currentDataSource[indexPath.row])",
//                                            preferredStyle: .alert)
//
//    searchController.isActive = false
//
//    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
//    alertController.addAction(action)
//    present(alertController, animated: true, completion: nil)
//  }
//
  
//}
