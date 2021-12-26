//
//  SearchBarTVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 26/12/2021.
//

import UIKit

class SearchBarTVC: UITableViewController, UISearchBarDelegate {
        
  
  @IBOutlet weak var searchBar: UISearchBar!
  

  let items = ["A", "B", "C", "D", "E"]
  var filtereItems: [String]!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      filtereItems = items
      searchBar.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return filtereItems.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

      cell.textLabel?.text = filtereItems[indexPath.row]
        return cell
    }
  

  // MARK: -SearchBar Confg

  func searchBar(_ searchBar: UISearchBar,
                 textDidChange searchText: String) {
    filtereItems = []
    
    if searchText == "" {
      filtereItems = items
    } else {
    
    for item in items {
      if item.lowercased().contains(searchText.lowercased()){
        filtereItems.append(item)
      }
    }
 }
    self.tableView.reloadData()
 
  }
   
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
