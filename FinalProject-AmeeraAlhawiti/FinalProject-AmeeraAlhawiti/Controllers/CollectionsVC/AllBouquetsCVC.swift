//
//  AllBouquetsCollection.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 20/12/2021.
//

import UIKit
import Firebase
import FirebaseStorage

class AllBouquetsCollection: UIViewController,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource {
  
  @IBOutlet weak var allBouquetsCollection: UICollectionView!
  
  
  var allBouquets = [Bouquets]()
  let db = Firestore.firestore()
  let rr = AllBouquetsCollectionViewCell()
  
  
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
  


  
  
  // favorite button
  @objc func addTOFavoraite(_ sender: UIButton){
    sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return allBouquets.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bouquetsCell",
                                                  for: indexPath) as! AllBouquetsCollectionViewCell

//    cell.setBouquet()
    cell.setUpCell(image: allBouquets[indexPath.row].imageOfBouquet,
                   price: allBouquets[indexPath.row].price,
                   imageName: allBouquets[indexPath.row].imageName)
  
    cell.addToFavoraite.tag = indexPath.row
        cell.addToFavoraite.addTarget(self, action: #selector(self.addTOFavoraite(_:)), for: .touchUpInside)
    return cell
  }
  
  
  @IBAction func addToCartPressed(_ sender: UIButton) {
    showAlertViewForAddButton()
  }
  
  @IBAction func addTOFavoraitePressed(_ sender: UIButton) {
    showAlertViewForFavoriateButton()
  }
 
  
  // MARK: - show massege for the user when  preesed addToCart button
  func showAlertViewForAddButton() {
    let alert = UIAlertController(title: "Added to cart!", message: "DO you want add to cart?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
      
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      
      let controller = storyboard.instantiateViewController(withIdentifier: "ShopCardVC") as! ShopCardVC
      self.navigationController?.pushViewController(controller, animated: true)
    }))
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
    present(alert, animated: true, completion: nil)
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

