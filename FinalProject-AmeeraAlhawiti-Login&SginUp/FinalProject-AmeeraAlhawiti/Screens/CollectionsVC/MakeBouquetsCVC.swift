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
  
  var descriptionFlowerImage: UIImage?
  var descriptionFlowerName = String()
  var descriptionFlowerPrice =  Double()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    makeYourBouquetCollection.dataSource = self
    makeYourBouquetCollection.delegate = self
    
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Blue1")!, priceOfFlower: 30.0, flowerName: "BlueRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Blue2")!, priceOfFlower: 33.0, flowerName: "BlueRose2"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Pink")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Pink2")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Pink3")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Pink4")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Purple1")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Purple2")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Red1")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Red2")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Red3")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "White1")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "White2")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Yellow1")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "Yellow2")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))

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
  
  
  func collectionView(_ collectionView: UICollectionView,
                      didSelectItemAt indexPath: IndexPath) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "ViewFlowersCollection") as! ViewFlowersCollectionVC
    controller.flowerImage = allFlowers[indexPath.row].imageOfFlower
    controller.flowerName = allFlowers[indexPath.row].flowerName
    controller.flowerPrice = allFlowers[indexPath.row].priceOfFlower
    self.navigationController?.pushViewController(controller, animated: true)
  }


}

struct Flowers{
  let imageOfFlower: UIImage
  let priceOfFlower: Double
  let flowerName: String
}
