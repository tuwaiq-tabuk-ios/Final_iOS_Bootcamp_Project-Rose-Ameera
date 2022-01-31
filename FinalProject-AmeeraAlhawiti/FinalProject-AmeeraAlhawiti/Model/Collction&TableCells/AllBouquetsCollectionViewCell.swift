
import UIKit
import FirebaseStorage
import Firebase

class AllBouquetsCollectionViewCell: UICollectionViewCell {
 
  @IBOutlet weak var bouquetImage: UIImageView!
  @IBOutlet weak var bouquetName: UILabel!
  @IBOutlet weak var bouquetPrice: UILabel!
  @IBOutlet weak var favoriteButton: UIButton!
  @IBOutlet weak var cartButton: UIButton!
  
  
  let db = Firestore.firestore()
  let idUsers = Auth.auth().currentUser?.uid
  
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    if sender.tag == 3 {
      uploadImage(image: bouquetImage.image!,
                  name: bouquetName.text!,
                  price:  Double(bouquetPrice.text!)!,
                  collection: "Favorite")
    } else if sender.tag == 0 {
      uploadImage(image: bouquetImage.image!,
                  name: bouquetName.text!,
                  price:  Double(bouquetPrice.text!)!,
                  collection: "Cart")
    }
  }
  
  
  func uploadImage(image:UIImage,name:String,price:Double, collection: String){
    let storge = Storage.storage().reference()
    let nameImage = UUID().uuidString
    let refImage = storge.child("Flowers/\(nameImage).png")
    let imageUpload = image.pngData()
    refImage.putData(imageUpload!, metadata: nil) { StorageMetadata, error in
      if error == nil {
        refImage.downloadURL { URLimage, error in
          if error == nil {
            print("\nSucessfuly added to \(collection) Collection\n")
            self.sendData(name: name, price: price, imageURL: "\(URLimage!)", collection:collection )
          }
        }
      }
    }
  }
  
  
  func sendData(name:String,price:Double,imageURL:String, collection:String ){
    let db = Firestore.firestore()
    let infoItem = MyBouquet(image: imageURL, price: price, name: name)
    db.collection("users").document(self.idUsers!).collection(collection).document("\(name)").setData(infoItem.getInfo())
    print("\n Succeeded\n")
  }
}
