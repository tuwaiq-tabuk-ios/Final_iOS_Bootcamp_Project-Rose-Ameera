//
//  AllBouquetsCollection.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 20/12/2021.
//

import UIKit

class AllBouquetsCollection: UIViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource {
  
  @IBOutlet weak var allBouquetsCollection: UICollectionView!
  
  var allBouquets = [Bouquets]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    allBouquetsCollection.delegate = self
    allBouquetsCollection.dataSource = self
    
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "bouquet1")!, price: 260, imageName: "Bouquet 1"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "bouquet2")!, price: 150, imageName: "Bouquet 2"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "bouquet3")!, price: 290, imageName: "Bouquet 3"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "bouquet4")!, price: 180, imageName: "Bouquet 4"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "bouquet5")!, price: 175, imageName: "Bouquet 5"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "bouquet6")!, price: 130, imageName: "Bouquet 6"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "bouquet7")!, price: 145, imageName: "Bouquet 7"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "bouquet8")!, price: 120, imageName: "Bouquet 8"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "bouquet9")!, price: 210, imageName: "Bouquet 9"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "bouquet10")!, price: 300, imageName: "Bouquet 10"))
    
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return allBouquets.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bouquetsCell",
                                                  for: indexPath) as! AllBouquetsCollectionViewCell
    
    cell.setUpCell(image: allBouquets[indexPath.row].imageOfBouquet,
                   price: allBouquets[indexPath.row].price,
                   imageName: allBouquets[indexPath.row].imageName)
    return cell
  }
  
//
//  func collectionView(_ collectionView: UICollectionView,
//                      didSelectItemAt indexPath: IndexPath) {
//
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let controller = storyboard.instantiateViewController(withIdentifier: "ViewBouquetsCollection") as! ViewBouquetsCollectionVC
//    controller.bouquetImage = allBouquets[indexPath.row].imageOfBouquet
//    controller.bouquetName = allBouquets[indexPath.row].imageName
//    controller.bouquetPrice = allBouquets[indexPath.row].price
//    self.navigationController?.pushViewController(controller, animated: true)
//  }
  
  
  @IBAction func addToCartPressed(_ sender: UIButton) {
    
    //    let product = self.
    
    let alert = UIAlertController(title: "Added to cart!",
                                  message: "Added item to cart!",
                                  preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Okay",
                                  style: UIAlertAction.Style.default,
                                  handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
}

