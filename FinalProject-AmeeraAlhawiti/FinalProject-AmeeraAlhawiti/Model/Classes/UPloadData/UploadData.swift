//
//  UploadImage.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 23/01/2022.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadData: UIViewController {
  
  //MARK: - this class for upload my data to firestore
  
  var bouquets: [DataModel] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    for item in 0..<16 {
      //random for price
      let priceRandom = Int.random(in: 150...400)
      bouquets.append(DataModel(image: UIImage(named: "bouquet\(item + 1)")!,
                                price:Double(Int(priceRandom)),
                                name: "bouquet\(item + 1)"))
    }
    print(bouquets)
  }
  
  
  @IBAction func uploadImageButtonPressed(_ sender: UIButton) {
    for x in 0..<bouquets.count {
      uploadImage(image: bouquets[x].image,
                  name: bouquets[x].name,
                  price: bouquets[x].price)
    }
  }
  
  
  func uploadImage(image:UIImage,name:String,price:Double){
    let storge = Storage.storage().reference()
    let nameImage = UUID().uuidString
    let refImage = storge.child("Bouquets/\(nameImage).png")
    let imageUpload = image.pngData()
    refImage.putData(imageUpload!, metadata: nil) { StorageMetadata, error in
      if error == nil {
        refImage.downloadURL { URLimage, error in
          if error == nil {
            print("\nupload succeeded\n")
            self.sendData(name: name, price: price, imageURL: "\(URLimage!)")
          }
        }
      }
    }
  }
  
  
  func sendData(name:String,price:Double,imageURL:String){
    let db = Firestore.firestore()
    let idItem = "\(Int.random(in: 0...10000))\(Int.random(in: 0...10000))"
    let infoItem = ["name":name,"price":price,"imageURL":imageURL] as [String : Any]
    db.collection("Bouquets").document(idItem).setData(infoItem)
    print("\n data has been sent\n")
  }
}


//MARK: - srtuct for upload my data
struct DataModel {
  let image: UIImage
  let price: Double
  let name: String
  
  func getInfo() -> [String:Any]{
      return ["image":image,"price":price,"name":name,] as! [String:Any]
  }
}


