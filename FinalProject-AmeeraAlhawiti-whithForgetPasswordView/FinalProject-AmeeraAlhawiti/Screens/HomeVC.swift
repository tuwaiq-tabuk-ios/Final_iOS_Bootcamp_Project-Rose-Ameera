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
  @IBOutlet weak var roseLable: UILabel!
  @IBOutlet weak var allBouquetsView: UIView!
  @IBOutlet weak var makeYourBouquetButton: UIButton!
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
  var count = 0
  
  
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
    
   // constraint for homeVC views
    roseLable.translatesAutoresizingMaskIntoConstraints = false
  //  autoCollectionView.translatesAutoresizingMaskIntoConstraints = false
    allBouquetsView.translatesAutoresizingMaskIntoConstraints = false
   // bouquetsCollectionView.translatesAutoresizingMaskIntoConstraints = false
    makeYourBouquetView.translatesAutoresizingMaskIntoConstraints = false
    

    roseLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
    roseLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                 
    allBouquetsView.topAnchor.constraint(equalTo: autoCollectionView.bottomAnchor, constant: 100).isActive = true
    allBouquetsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
    allBouquetsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 300).isActive = true

    makeYourBouquetView.topAnchor.constraint(equalTo: bouquetsCollectionView.bottomAnchor, constant: 60).isActive = true
    makeYourBouquetView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -300).isActive = true
    makeYourBouquetView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    makeYourBouquetView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true

    
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
    // Cell for floewrs bouquets collection
    let cellA = bouquetsCollectionView.dequeueReusableCell(withReuseIdentifier: "bouquetsCell",
                                                           for: indexPath) as! ScrollBouquetsCollectionViewCell
    
    cellA.setUpCell(image: floewrsBouquetsCollection[indexPath.row].imageOfBouquet,
                    price: floewrsBouquetsCollection[indexPath.row].price,
                    imageName: floewrsBouquetsCollection[indexPath.row].imageName)

    
    if (collectionView == autoCollectionView) {
      // Cell for auto images slider collection
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
//    if collectionView == autoCollectionView{
    return CGSize(width: autoCollectionView.frame.width,
                  height: autoCollectionView.frame.height)
//    }
//    return CGSize(width: self.view.frame.width * 0.45, height: self.view.frame.height * 0.45)
  }
  
  
//  func collectionView(_ collectionView: UICollectionView,
//                      layout collectionViewLayout: UICollectionViewLayout,
//                      sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
//      return layout.itemSize
//    }else{
//      return .zero
//    }
//  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  
  func buttonsCornerRadius(){
    autoCollectionView.layer.borderWidth = 1
    autoCollectionView.layer.borderColor = UIColor.cmRed.cgColor
    autoCollectionView.layer.cornerRadius = 15
    
    bouquetsCollectionView.layer.borderWidth = 1
    bouquetsCollectionView.layer.borderColor = UIColor.cmRed.cgColor
   // bouquetsCollectionView.layer.cornerRadius = 15
    
    makeYourBouquetView.layer.borderColor = UIColor.cmRed.cgColor
    makeYourBouquetView.layer.borderWidth = 1.5
    makeYourBouquetView.layer.cornerRadius = 35
 
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
    
    if count == 0  {
    let popOverVC =
    UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MorePopUpVC") as! MorePopUpVC
    self.addChild(popOverVC)
    popOverVC.view.frame = self.view.frame
    self.view.addSubview(popOverVC.view)
    popOverVC.didMove(toParent: self)
      count += 1
    
    }
    else if count == 1 {

      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
      self.navigationController?.pushViewController(controller, animated: false)
    }
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
  
  @IBAction func favoraiteButtonPressed(_ sender: UIBarButtonItem) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "FavoraiteVC") as! FavoraiteVC
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  
}
