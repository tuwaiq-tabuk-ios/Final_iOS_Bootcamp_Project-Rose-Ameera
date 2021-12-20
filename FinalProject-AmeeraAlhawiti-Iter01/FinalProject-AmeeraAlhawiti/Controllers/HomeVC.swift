//
//  HomeVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 08/12/2021.
//

import UIKit

class HomeVC: UIViewController,
              UICollectionViewDelegate,
              UICollectionViewDataSource,
              UICollectionViewDelegateFlowLayout {
  
  

  @IBOutlet weak var autoCollectionView: UICollectionView!
  @IBOutlet weak var bouquetsCollectionView: UICollectionView!
  
  @IBOutlet weak var userView: UIView!
  
  
  let labelsName = ["Chooce Or Create your own bouquet 😍",
                    "Or do you want to gift it? 💕",
                    "Log in now 👀"]
  
  let floewrsBouquetsCollection = [UIImage(named:"IMG_0811")!, UIImage(named:"IMG_0812")!,
                                   UIImage(named:"IMG_0813")!, UIImage(named:"IMG_0814")!,
                                   UIImage(named:"IMG_0815")!, UIImage(named:"IMG_0816")!,
                                   UIImage(named:"IMG_0817")!, UIImage(named:"IMG_0818")!]
  
  let bouquetsName = ["Rosé1", "Rosé2", "Rosé3", "Rosé4", "Rosé5", "Rosé6", "Rosé7", "Rosé8"]
  
  var timer: Timer?
  var currentCellIndex = 0
  public var vc = UIViewController()
  
  
//  let AllBouquets :UIButton{
//    let AllBouquets = UIButton()
//    
//  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    autoCollectionView.layer.borderWidth = 0.5
    autoCollectionView.layer.borderColor = UIColor.black.cgColor
    autoCollectionView.layer.cornerRadius = 15
    
    autoCollectionView.delegate = self
    autoCollectionView.dataSource = self
    bouquetsCollectionView.delegate = self
    bouquetsCollectionView.dataSource = self
    
    startTimer()
    
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    
    if (collectionView == autoCollectionView) {
      return labelsName.count
    }
    return floewrsBouquetsCollection.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    // Cell for auto images slider collection
    let cellA = bouquetsCollectionView.dequeueReusableCell(withReuseIdentifier: "bouquetsCell",
                                                           for: indexPath) as! BouquetsCollectionViewCell
    
    cellA.bouquetsCell.image = floewrsBouquetsCollection[indexPath.row]
    cellA.nameOfBouquetLabel.text = "\(bouquetsName[indexPath.row])"
//    cellA.bouquetsCell.layer.borderWidth = 1
//    cellA.bouquetsCell.layer.borderColor = UIColor.black.cgColor
    
    if (collectionView == autoCollectionView) {
      // Cell for floewrs bouquets collection
      let cellB = autoCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCell",
                                                         for: indexPath) as! AutoCollectionViewCell
      
//      cellB.imageCell.image = autoImagesSlider[indexPath.row]
      cellB.nameLabel2.text = "\(labelsName[indexPath.row])"
      return cellB
    }
    return cellA
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width,
                  height: collectionView.frame.height)
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  
  @objc func slidToNext(){
    if currentCellIndex < labelsName.count - 1 {
      currentCellIndex += 1
    }
    else{
      currentCellIndex = 0
    }
    autoCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
  }
  
  
  func startTimer(){
    timer = Timer.scheduledTimer(timeInterval: 2.0,
                                 target: self,
                                 selector: #selector(slidToNext),
                                 userInfo: nil,
                                 repeats: true)
  }
  
  
  @IBAction func userHomeButton(_ sender: UIButton) {
    
  }
}
