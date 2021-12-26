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
    
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "blue1")!, priceOfFlower: 30.0, flowerName: "BlueRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "blue2")!, priceOfFlower: 33.0, flowerName: "BlueRose2"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "pink1")!, priceOfFlower: 30.0, flowerName: "PinkRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "pink2")!, priceOfFlower: 30.0, flowerName: "PinkRose2"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "pink3")!, priceOfFlower: 30.0, flowerName: "PinkRose3"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "pink4")!, priceOfFlower: 30.0, flowerName: "PinkRose4"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "purple1")!, priceOfFlower: 30.0, flowerName: "PurpleRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "purple2")!, priceOfFlower: 30.0, flowerName: "PurpleRose2"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "red1")!, priceOfFlower: 30.0, flowerName: "RedRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "red2")!, priceOfFlower: 30.0, flowerName: "RedRose2"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "red3")!, priceOfFlower: 30.0, flowerName: "RedRose3"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "white1")!, priceOfFlower: 30.0, flowerName: "WhiteRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "white2")!, priceOfFlower: 30.0, flowerName: "WhiteRose2"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "yellow1")!, priceOfFlower: 30.0, flowerName: "YellowRose1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "yellow2")!, priceOfFlower: 30.0, flowerName: "YellowRose2"))
    
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return allFlowers.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "makeBouquetCell",
                                                  for: indexPath) as! MakeYourBouquetCell
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


//MARK: - struct for variables of collection
struct Flowers{
  let imageOfFlower: UIImage
  let priceOfFlower: Double
  let flowerName: String
}
