//
//  MakeBouquetsCollection.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 21/12/2021.
//

import UIKit

class MakeBouquetsCollection: UIViewController,
                              UICollectionViewDelegate,
                              UICollectionViewDataSource{
  
  @IBOutlet weak var makeYourBouquetCollection: UICollectionView!
  
  var allFlowers = [Flowers]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    makeYourBouquetCollection.dataSource = self
    makeYourBouquetCollection.delegate = self
    
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower1")!, priceOfFlower: 15, flowerName: "Rosé 1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower2")!, priceOfFlower: 10, flowerName: "Rosé 2"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower3")!, priceOfFlower: 10, flowerName: "Rosé 3"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower4")!, priceOfFlower: 10, flowerName: "Rosé 4"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower5")!, priceOfFlower: 10, flowerName: "Rosé 5"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower6")!, priceOfFlower: 10, flowerName: "Rosé 6"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower7")!, priceOfFlower: 20, flowerName: "Rosé 7"))
    
  }
  
  
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return allFlowers.count
  }
  
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "makeBouquetCell", for: indexPath) as! MakeYourBouquetCell
     cell.setUpFlowerCell(image: allFlowers[indexPath.row].imageOfFlower,
                          price: allFlowers[indexPath.row].priceOfFlower,
                          imageName: allFlowers[indexPath.row].flowerName)
    return cell
  }
  
  
//  func collectionView(_ collectionView: UICollectionView,
//                      didSelectItemAt indexPath: IndexPath) {
//    
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let controller = storyboard.instantiateViewController(withIdentifier: "ViewFlowersCollection") as! ViewFlowersCollectionVC
//    controller.flowerImage = allFlowers[indexPath.row].imageOfFlower
//    controller.flowerName = allFlowers[indexPath.row].flowerName
//    controller.flowerPrice = allFlowers[indexPath.row].priceOfFlower
//    self.navigationController?.pushViewController(controller, animated: true)
//  }

}

