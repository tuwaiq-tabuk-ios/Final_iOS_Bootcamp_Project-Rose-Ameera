//
//  HomeVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 08/12/2021.
//

import UIKit
import Firebase

class HomeVC: UIViewController,
              UICollectionViewDelegate,
              UICollectionViewDataSource,
              UICollectionViewDelegateFlowLayout {
  
  
  //MARK: - Outlets
  @IBOutlet weak var autoCollectionView: UICollectionView!
  @IBOutlet weak var bouquetsCollectionView: UICollectionView!
  @IBOutlet weak var makeYourBouquetButton: UIButton!
  @IBOutlet weak var sideMinuConstraint: NSLayoutConstraint!
  @IBOutlet weak var viewSlideOUt: UIView!
  

 
  @IBOutlet weak var addressButton: UIButton!
  @IBOutlet weak var sginInButton: UIButton!
  @IBOutlet weak var customerCareButton: UIButton!
  @IBOutlet weak var aboutUsButton: UIButton!
  @IBOutlet weak var makeYourBouquetView: UIView!
  
  
  
  //MARK: - Variables
  let labelsName = ["Chooce Or Create your own bouquet 😍",
                    "Or do you want to gift it? 💕",
                    "Log in now 👀"]
  
  let floewrsBouquetsCollection = [Bouquets(imageOfBouquet: UIImage(named:"bouquet1")!, price: 90.0, imageName: "Rosé1"),
                                   Bouquets(imageOfBouquet: UIImage(named:"bouquet2")!, price: 90.0, imageName: "Rosé2"),
                                   Bouquets(imageOfBouquet: UIImage(named:"bouquet3")!, price: 90.0, imageName: "Rosé3"),
                                   Bouquets(imageOfBouquet: UIImage(named:"bouquet4")!, price: 90.0, imageName: "Rosé4"),
                                   Bouquets(imageOfBouquet: UIImage(named:"bouquet5")!, price: 90.0, imageName: "Rosé5")]
  

  var timer: Timer?
  var currentCellIndex = 0
  public var vc = UIViewController()
  var isSlideMenuHidden = true
  var isSearching = false
  var filteredItems: [String]!
  
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    // Collections delegats
    autoCollectionView.delegate = self
    autoCollectionView.dataSource = self
    bouquetsCollectionView.delegate = self
    bouquetsCollectionView.dataSource = self
    // functions calls
    buttonsCornerRadius()
    startTimer()
    // initialize constant with -240 for slid menu
    sideMinuConstraint.constant = -240
    
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
                                                           for: indexPath) as! ScrollBouquetsCollectionViewCell
    
    cellA.setUpCell(image: floewrsBouquetsCollection[indexPath.row].imageOfBouquet,
                    price: floewrsBouquetsCollection[indexPath.row].price,
                    imageName: floewrsBouquetsCollection[indexPath.row].imageName)
    
    
    if (collectionView == autoCollectionView) {
      // Cell for floewrs bouquets collection
      let cellB = autoCollectionView.dequeueReusableCell(withReuseIdentifier: "homeCell",
                                                         for: indexPath) as! AutoCollectionViewCell
      
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
  
    
  func buttonsCornerRadius(){
    autoCollectionView.layer.borderWidth = 0.5
    autoCollectionView.layer.borderColor = UIColor.cmRed.cgColor
    autoCollectionView.layer.cornerRadius = 15
    
    makeYourBouquetView.layer.borderColor = UIColor.cmRed.cgColor
    makeYourBouquetView.layer.borderWidth = 1
    makeYourBouquetView.layer.cornerRadius = 35
    
//    bouquetCellView.layer.borderColor = UIColor.cmRed.cgColor
//    bouquetCellView.layer.borderWidth = 1
    
    Utilities.styleHollowButton(sginInButton)
    Utilities.styleHollowButton(customerCareButton)
    Utilities.styleHollowButton(aboutUsButton)
    Utilities.styleHollowButton(addressButton)
   

    // view for slid out menu
    viewSlideOUt.layer.cornerRadius = 5
    viewSlideOUt.layer.borderColor = UIColor.gray.cgColor
    viewSlideOUt.layer.borderWidth = 2
    
    viewSlideOUt.backgroundColor = UIColor.cmRed.withAlphaComponent(0.8)
  }
  
  
  @objc func slidToNext(){
    if currentCellIndex < labelsName.count - 1 {
      currentCellIndex += 1
    }
    else{
      currentCellIndex = 0
    }
    autoCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex,
                                                  section: 0),
                                    at: .centeredHorizontally,
                                    animated: true)
  }
  
  
  func startTimer(){
    timer = Timer.scheduledTimer(timeInterval: 2.0,
                                 target: self,
                                 selector: #selector(slidToNext),
                                 userInfo: nil,
                                 repeats: true)
  }
  
  // Action Button for slide out menu
  @IBAction func organizeBtnPressed(_ sender: UIBarButtonItem) {
    if isSlideMenuHidden{
      sideMinuConstraint.constant = 0
    }
    else{
      sideMinuConstraint.constant = -240
    }
    isSlideMenuHidden = !isSlideMenuHidden
  }
  
  
  @IBAction func customerCarePressed(_ sender: UIButton) {

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "PopupScreen") as! CustmerCarePopupVC
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
  @IBAction func aboutUsPressed(_ sender: UIButton) {
//    vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsPage") as! AboutUsPageVC
//    present(vc,animated: false, completion: nil)
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "AboutUsPage") as! AboutUsPageVC
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
  @IBAction func SginInPressed(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileScreen") as! UserProfileScreen
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
  @IBAction func cartButtonPressed(_ sender: UIBarButtonItem) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "ShopCardVC") as! ShopCardVC
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
  @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "SearchBarVC2") as! SearchBarVC2
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
  @IBAction func addressButtonPressed(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "UserProfileAddress") as! UserProfileAddress
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
}
