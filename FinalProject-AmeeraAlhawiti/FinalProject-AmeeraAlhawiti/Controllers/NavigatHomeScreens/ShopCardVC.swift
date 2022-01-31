import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class ShopCardVC: UIViewController,
                  UITableViewDelegate,
                  UITableViewDataSource{
  
  @IBOutlet weak var shopCardTable: UITableView!
  @IBOutlet weak var continueButton: UIButton!
  
  
  var item: [ShowData] = []
  let db = Firestore.firestore()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    shopCardTable.delegate = self
    shopCardTable.dataSource = self
    getData()
    continueButton.layer.cornerRadius = 25
    continueButton.layer.borderWidth = 1
    continueButton.layer.borderColor = UIColor.black.cgColor
  }
  
  
  //MARK: reload data in table
  func getData(){
    let userId = Auth.auth().currentUser?.uid
    db.collection("users").document(userId!).collection("Cart").getDocuments
    { Snapshot, error in
      if error == nil {
        for document in Snapshot!.documents {
          let imageWantPay = document.get("image") as! String
          let imageName = document.get("name") as! String
          let imagePrice = document.get("price") as! Double
          
          self.item.append(ShowData(image: imageWantPay,
                                    price: "\(imagePrice)",
                                    name: imageName))
          self.shopCardTable.reloadData()
        }
      }
    }
  }
  
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return item.count
  }
  
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! ShopCartCell
    let data = item[indexPath.row]
    cell.cellNameLabel.text = data.name
    cell.cellPriceLabel.text = "\(data.price) SAR"
    DispatchQueue.global().async{
      let data = try? Data(contentsOf: URL(string: self.item[indexPath.row].image)!)
      if let data = data, let image = UIImage(data: data) {
        DispatchQueue.main.async {
          cell.imageCell?.image = image
          cell.imageCell?.contentMode = .scaleToFill
        }
      }
    }
    return cell
  }
  
  
//  func tableView(_ tableView: UITableView,
//                 heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return 100
//  }
  
  
  func tableView(_ tableView: UITableView,
                 trailingSwipeActionsConfigurationForRowAt indexPath:
                 IndexPath) -> UISwipeActionsConfiguration? {
    let deletAction = UIContextualAction(style: .destructive,
                                         title: "Delete") { action, view, completion in
      self.item.remove(at: indexPath.row)
      self.shopCardTable.reloadData()
      completion(true)
    }
    return UISwipeActionsConfiguration(actions: [deletAction])
  }
  
  
  //MARK: remove select from cell
  func tableView(_ tableView: UITableView,
                 didSelectRowAt indexPath: IndexPath) {
      //Change the selected background view of the cell.
    shopCardTable.deselectRow(at: indexPath, animated: true)
  }
}
