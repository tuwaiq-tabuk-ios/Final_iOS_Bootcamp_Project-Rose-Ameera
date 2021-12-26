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
  
  var currentDescriptionImage: UIImage?
  var currentDescriptionName = String()
  var currentDescriptionPrice =  Double()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    allBouquetsCollection.delegate = self
    allBouquetsCollection.dataSource = self
    
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "IMG_0811")!, price: 220.0, imageName: "Rosé1"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "IMG_0812")!, price: 150.0, imageName: "Rosé2"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "IMG_0813")!, price: 200.0, imageName: "Rosé3"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "IMG_0814")!, price: 180.0, imageName: "Rosé4"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "IMG_0815")!, price: 175.0, imageName: "Rosé5"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "IMG_0816")!, price: 130.0, imageName: "Rosé6"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "IMG_0817")!, price: 145.0, imageName: "Rosé7"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "IMG_0818")!, price: 120.0, imageName: "Rosé8"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "IMG_0818")!, price: 120.0, imageName: "Rosé9"))
    allBouquets.append(Bouquets(imageOfBouquet: UIImage(named: "IMG_0816")!, price: 130.0, imageName: "Rosé10"))
    
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
  
  
  func collectionView(_ collectionView: UICollectionView,
                      didSelectItemAt indexPath: IndexPath) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "ViewBouquetsCollection") as! ViewBouquetsCollectionVC
    controller.bouquetImage = allBouquets[indexPath.row].imageOfBouquet
    controller.bouquetName = allBouquets[indexPath.row].imageName
    controller.bouquetPrice = allBouquets[indexPath.row].price
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
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


//MARK: - struct for variable of collection

struct Bouquets{
  let imageOfBouquet: UIImage
  let price: Double
  let imageName: String
}
