

import UIKit
import Firebase
import FirebaseFirestore

class AllBouquetsCollection: UIViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource {
  
  @IBOutlet weak var allBouquetsCollection: UICollectionView!
  
  
  var allBouquets = [MyData]()
  let db = Firestore.firestore()
  var arrCart:[DataModel] = []
  let idUsers = Auth.auth().currentUser?.uid
  var bouquetName: String = ""
  var bouquetImage: String = ""
  var bouquetPrice: String = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    allBouquetsCollection.delegate = self
    allBouquetsCollection.dataSource = self
  }
  
  
  //MARK: - to get bouquets data
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    readData()
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return allBouquets.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bouquetsCell",
                                                  for: indexPath) as! AllBouquetsCollectionViewCell
    let index = allBouquets[indexPath.row]
    cell.bouquetPrice.text = "\(index.price)"
    cell.bouquetName.text = index.imageName
    bouquetImage = index.image
    print("# # Price: \(index.price)")
    print("# # Image name:\(index.imageName)")
    DispatchQueue.global().async {
      let data = try? Data(contentsOf: URL(string: index.image)!)
      if let data = data , let image = UIImage(data: data){
        DispatchQueue.main.async {
          cell.bouquetImage.image = image
        }
      }
    }
    // colorfull like button
    cell.favoriteButton.addTarget(self,
                                  action: #selector(self.addTOFavoraite(_:)),
                                  for: .touchUpInside)
    // alert message
    cell.cartButton.addTarget(self,
                              action: #selector(showAlertViewForAddButton),
                              for: .touchUpInside)
    return cell
  }

  
  //MARK: - reading data from firebase
  func readData(){
    db.collection("Bouquets").getDocuments { [self] DocumentSnapshot, Error in
      if Error != nil {
        print("sorry")
      }else{
        guard let data = DocumentSnapshot?.documents else {return}
        self.allBouquets.removeAll()
        for document in data {
          self.allBouquets.append(MyData(image: document.get("imageURL") as! String,
                                         price: document.get("price") as! Double,
                                         imageName: document.get("name") as! String))
          print("Iam Here")
          print("# # \(allBouquets.count)")
        }
        self.allBouquetsCollection.reloadData()
      }
    }
  }
  
  
  // favorite button color
  @objc func addTOFavoraite(_ sender: UIButton){
    sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
  }
  
  
  // MARK: - show massege for the user when  preesed addToCart button
  @objc func showAlertViewForAddButton() {
    let alert = UIAlertController(title: "Added 🤩",
                                  message: "",
                                  preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok",
                                  style: .default,
                                  handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
