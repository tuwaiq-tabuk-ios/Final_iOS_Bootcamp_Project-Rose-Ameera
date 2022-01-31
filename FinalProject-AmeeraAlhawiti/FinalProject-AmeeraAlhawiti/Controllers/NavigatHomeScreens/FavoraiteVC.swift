import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class FavoraiteVC: UIViewController,
                   UITableViewDelegate,
                   UITableViewDataSource {
  
  
  @IBOutlet weak var favoraiteTable: UITableView!
  
  var item: [ShowData] = []
  let db = Firestore.firestore()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    favoraiteTable.delegate = self
    favoraiteTable.dataSource = self
    getData()
  }
  
  
  //MARK: reload data in table
  func getData(){
    let userId = Auth.auth().currentUser?.uid
    db.collection("users").document(userId!).collection("Favorite").getDocuments
    { Snapshot, error in
      if error == nil {
        for document in Snapshot!.documents {
          let imageWantPay = document.get("image") as! String
          let imageName = document.get("name") as! String
          let imagePrice = document.get("price") as! Double
          
          self.item.append(ShowData(image: imageWantPay,
                                    price: "\(imagePrice)",
                                    name: imageName))
          self.favoraiteTable.reloadData()
        }
      }
    }
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return item.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FavoraiteTableCell") as! FavoraiteTableCell
    let data = item[indexPath.row]
    cell.nameLable.text = data.name
    cell.priceLable.text = "\(data.price) SAR"
    DispatchQueue.global().async{
      let data = try? Data(contentsOf: URL(string: self.item[indexPath.row].image)!)
      if let data = data, let image = UIImage(data: data) {
        DispatchQueue.main.async {
          cell.photoView?.image = image
          cell.photoView?.contentMode = .scaleToFill
        }
      }
    }
    return cell
  }
  
  
  func tableView(_ tableView: UITableView,
                 trailingSwipeActionsConfigurationForRowAt indexPath:
                 IndexPath) -> UISwipeActionsConfiguration? {
    let deletAction = UIContextualAction(style: .destructive,
                                         title: "Delete") { action, view, completion in
      self.item.remove(at: indexPath.row)
      self.favoraiteTable.reloadData()
      completion(true)
    }
    return UISwipeActionsConfiguration(actions: [deletAction])
  }
  
  
  //MARK: remove select from cell
  func tableView(_ tableView: UITableView,
                 didSelectRowAt indexPath: IndexPath) {
    //Change the selected background view of the cell.
    favoraiteTable.deselectRow(at: indexPath, animated: true)
  }
}
