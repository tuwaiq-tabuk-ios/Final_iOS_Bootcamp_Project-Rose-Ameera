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
  
  @IBOutlet weak var sginInButton: UIButton!
  @IBOutlet weak var customerCareButton: UIButton!
  @IBOutlet weak var aboutUsButton: UIButton!
  @IBOutlet weak var logOutButtton: UIButton!
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
  
//  let floewrsBouquetsCollection = [UIImage(named:"IMG_0811")!, UIImage(named:"IMG_0812")!,
//                                   UIImage(named:"IMG_0813")!, UIImage(named:"IMG_0814")!,
//                                   UIImage(named:"IMG_0815")!, UIImage(named:"IMG_0816")!,
//                                   UIImage(named:"IMG_0817")!, UIImage(named:"IMG_0818")!]
//
//  let bouquetsName = ["Rosé1", "Rosé2", "Rosé3", "Rosé4", "Rosé5", "Rosé6", "Rosé7", "Rosé8"]

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
    //cellA.nameOfBouquetLabel.text = "\(bouquetsName[indexPath.row])"

    
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
  
  
//  func collectionView(_ collectionView: UICollectionView,
//                      didSelectItemAt indexPath: IndexPath) {
//
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let controller = storyboard.instantiateViewController(withIdentifier: "ViewBouquetsScrollCVC") as! ViewBouquetsScrollCVC
//    controller.imageOfBouquet = floewrsBouquetsCollection[indexPath.row].imageOfBouquet
//    controller.nameOfBouquet = floewrsBouquetsCollection[indexPath.row].imageName
//    controller.priceOfBouquet = floewrsBouquetsCollection[indexPath.row].price
//    self.navigationController?.pushViewController(controller, animated: true)
//  }
  
  func buttonsCornerRadius(){
    autoCollectionView.layer.borderWidth = 0.5
    autoCollectionView.layer.borderColor = UIColor.black.cgColor
    autoCollectionView.layer.cornerRadius = 15
    
    makeYourBouquetView.layer.borderColor = UIColor.cmPink.cgColor
    makeYourBouquetView.layer.borderWidth = 1
    makeYourBouquetView.layer.cornerRadius = 35
    
    Utilities.styleHollowButton(sginInButton)
    Utilities.styleHollowButton(customerCareButton)
    Utilities.styleHollowButton(aboutUsButton)
//    Utilities.styleHollowButton(logOutButtton)
   

//    sginInButton.layer.borderColor = UIColor.gray.cgColor
//    sginInButton.layer.borderWidth = 1
//
//    customerCareButton.layer.borderColor = UIColor.gray.cgColor
//    customerCareButton.layer.borderWidth = 1
//
//    aboutUsButton.layer.borderColor = UIColor.gray.cgColor
//    aboutUsButton.layer.borderWidth = 1
//
//    logOutButtton.layer.borderColor = UIColor.gray.cgColor
//    logOutButtton.layer.borderWidth = 1
    
    // view for slid out menu
    viewSlideOUt.layer.cornerRadius = 5
    viewSlideOUt.layer.borderColor = UIColor.gray.cgColor
    viewSlideOUt.layer.borderWidth = 2
    
    viewSlideOUt.backgroundColor = UIColor.cmPink.withAlphaComponent(0.8)
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
//    let popOverVC =
//    UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupScreen") as! CustmerCarePopupVC
//    self.addChild(popOverVC)
//    popOverVC.view.frame = self.view.frame
//    self.view.addSubview(popOverVC.view)
//    popOverVC.didMove(toParent: self)
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "PopupScreen") as! CustmerCarePopupVC
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
  @IBAction func aboutUsPressed(_ sender: UIButton) {
    vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsPage") as! AboutUsPageVC
    present(vc,animated: false, completion: nil)
  }
  
  
  @IBAction func SginInPressed(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
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
  
  
  @IBAction func logOutButtonPressed(_ sender: UIButton) {
    
    do{
      try Auth.auth().signOut()
      dismiss(animated: true, completion: nil)
    } catch let sginOutError as NSError {
      print("Error signing out: %@", sginOutError)
    }
  }
  
  

    

  
  
}
