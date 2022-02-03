
import UIKit
import Firebase
import FirebaseFirestore

class MakeBouquetsCollection: UIViewController,
                              UICollectionViewDelegate,
                              UICollectionViewDataSource{
  
  @IBOutlet weak var makeYourBouquetCollection: UICollectionView!
  
  var allFlowers = [MyData]()
  let db = Firestore.firestore()
  var arrCart:[DataModel] = []
  let idUsers = Auth.auth().currentUser?.uid
  var flowerName: String = ""
  var flowerImage: String = ""
  var flowerPrice: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    makeYourBouquetCollection.dataSource = self
    makeYourBouquetCollection.delegate = self
  }
  
  
  //MARK: - to get flowers data
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    readData()
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return allFlowers.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "makeBouquetCell",
                                                  for: indexPath) as! MakeYourBouquetCell
    
    let index = allFlowers[indexPath.row]
    cell.flowerName.text = index.imageName
    cell.flowerPrice.text = "\(index.price)"
    flowerImage = index.image
    DispatchQueue.global().async {
      let data = try? Data(contentsOf: URL(string: index.image)!)
      if let data = data , let image = UIImage(data: data){
        DispatchQueue.main.async {
          cell.flowerImage.image = image
        }
      }
    }
    // colorfull like button
    cell.addToFavoraite.addTarget(self,
                                  action: #selector(addTOFavoraite(_:)),
                                  for: .touchUpInside)
    // alert message
    cell.addToCart.addTarget(self,
                              action: #selector(showAlertViewForAddButton),
                              for: .touchUpInside)
    return cell
  }
  
  
  //MARK: - reading data from firebase
  func readData(){
    db.collection("Flowers").getDocuments { [self] DocumentSnapshot, Error in
      if Error != nil {
        print("sorry")
      }else{
        guard let data = DocumentSnapshot?.documents else {return}
        self.allFlowers.removeAll()
        for document in data {
          self.allFlowers.append(MyData(image: document.get("imageURL") as! String,
                                        price: document.get("price") as! Double,
                                        imageName: document.get("name") as! String))
          print("Iam Here")
          print("# # \(allFlowers.count)")
        }
        self.makeYourBouquetCollection.reloadData()
      }
    }
  }
  
  
  // favorite button
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
