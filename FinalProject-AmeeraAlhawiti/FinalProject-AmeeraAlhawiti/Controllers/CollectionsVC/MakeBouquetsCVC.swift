//
//  MakeBouquetsCollection.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 21/12/2021.
//

import UIKit
import CoreData

class MakeBouquetsCollection: UIViewController,
                              UICollectionViewDelegate,
                              UICollectionViewDataSource{
  
  @IBOutlet weak var makeYourBouquetCollection: UICollectionView!
  
  var allFlowers = [Flowers]()
  
  
  
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    makeYourBouquetCollection.dataSource = self
    makeYourBouquetCollection.delegate = self
    

    
    
    // call function for Spinner
    
    
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower1")!, priceOfFlower: 15, flowerName: "Rosé 1"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower2")!, priceOfFlower: 10, flowerName: "Rosé 2"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower3")!, priceOfFlower: 10, flowerName: "Rosé 3"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower4")!, priceOfFlower: 10, flowerName: "Rosé 4"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower5")!, priceOfFlower: 10, flowerName: "Rosé 5"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower6")!, priceOfFlower: 10, flowerName: "Rosé 6"))
    allFlowers.append(Flowers(imageOfFlower: UIImage(named: "flower7")!, priceOfFlower: 20, flowerName: "Rosé 7"))
    
  }
  
  // favorite button
  @objc func addTOFavoraite(_ sender: UIButton){
    sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return allFlowers.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "makeBouquetCell", for: indexPath) as! MakeYourBouquetCell
    cell.setUpFlowerCell(image: allFlowers[indexPath.row].imageOfFlower,
                         price: allFlowers[indexPath.row].priceOfFlower,
                         imageName: allFlowers[indexPath.row].flowerName)
    
    cell.addToFavoraite.tag = indexPath.row
    cell.addToFavoraite.addTarget(self, action: #selector(addTOFavoraite(_:)), for: .touchUpInside)
    return cell
  }
  
  
  @IBAction func addToCart(_ sender: UIButton) {
    
//    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//    let controll = storyBoard.instantiateViewController(withIdentifier: "ShopCardVC") as! ShopCardVC
//    self.present(controll, animated: true, completion: nil)
    
    showAlertView()
  }
  
  
  @IBAction func addToFavoraitePressed(_ sender: UIButton) {
    showAlertViewForFavoriateButton()
  }
  
  
  // MARK: - show massege for the user when  preesed addToCart button
  func showAlertView() {
    let alert = UIAlertController(title: "Added to cart!", message: "DO you want add to cart?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
      
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "ShopCardVC") as! ShopCardVC
      self.navigationController?.pushViewController(controller, animated: true)
    }))
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
  
  // MARK: - show massege for the user when he preesed addToFavoraite button
  func showAlertViewForFavoriateButton() {
    let alert = UIAlertController(title: "Added to Favoraite!", message: "DO you want Show Favoraite Page?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
      
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      
      let controller = storyboard.instantiateViewController(withIdentifier: "FavoraiteVC") as! FavoraiteVC
      self.navigationController?.pushViewController(controller, animated: true)
    }))
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
