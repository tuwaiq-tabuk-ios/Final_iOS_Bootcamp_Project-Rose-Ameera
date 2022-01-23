//
//  AllBouquetsCollectionViewCell.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 20/12/2021.
//

import UIKit
import FirebaseStorage

class AllBouquetsCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var bouquetImage: UIImageView!
  @IBOutlet weak var bouquetName: UILabel!
  @IBOutlet weak var bouquetPrice: UILabel!
  @IBOutlet weak var addToFavoraite: UIButton!
  
  
  func setUpCell(image: UIImage, price: Double, imageName: String){
    bouquetImage.image = image
    bouquetPrice.text = "\(price) SAR"
    bouquetName.text = "\(imageName)"
  }
  
  func setBouquet(){
    let storageRef = Storage.storage().reference()
    let data = ["bouquet1","bouquet2","bouquet3","bouquet4","bouquet5","bouquet6","bouquet7","bouquet8","bouquet9","bouquet10"]
    let imageRef = storageRef.child("images/file/\(data)")
    let image = bouquetImage.image!.jpegData(compressionQuality: 0.5)
    imageRef.putData(image!, metadata: nil) { metaDate, error in
        if error == nil {
            imageRef.downloadURL { url, error in
                print(url!)
                self.changeImage(URLimage: url!)
            }
        }
    }
  }
  
  
  func changeImage(URLimage:URL){
     let data = try?  Data(contentsOf: URLimage)
      self.bouquetImage.image = UIImage(data: data!)
  }
  
}
