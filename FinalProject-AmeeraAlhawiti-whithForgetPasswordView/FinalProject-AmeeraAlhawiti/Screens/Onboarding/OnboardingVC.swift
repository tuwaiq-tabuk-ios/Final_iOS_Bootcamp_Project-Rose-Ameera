//
//  OnboardingVC.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 02/01/2022.
//

import UIKit

class OnboardingVC: UIViewController {
  
  
  @IBOutlet weak var slideScreenCollection: UICollectionView!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var nextButton: UIButton!
  
  var slides = [OnboardingSlide (title: "Want to buy a bouquet of roses?", image: UIImage(named: "Want?")!),
                OnboardingSlide(title: "And you at home?", image: UIImage(named: "delivery")!),
                OnboardingSlide(title: "Welcome To Rosé", image: UIImage(named: "IMG_1156")!)]
  
  var currentPage = 0 {
    didSet {
      pageControl.currentPage = currentPage
      if currentPage == slides.count - 1 {
        nextButton.setTitle("Get Started", for: .normal)
      }
      else{
        nextButton.setTitle("Next", for: .normal)
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    slideScreenCollection.delegate = self
    slideScreenCollection.dataSource = self
    
    
  }
  
  @IBAction func nextButtonPressed(_ sender: UIButton) {
    
    if currentPage == slides.count - 1 {
      
      let controller = storyboard?.instantiateViewController(withIdentifier: "homeNavigation") as! UINavigationController
      controller.modalPresentationStyle = .fullScreen
      controller.modalTransitionStyle = .flipHorizontal
      present(controller, animated: true, completion: nil)
     
    }
    else {
      currentPage += 1
      
      let indexPath = IndexPath(item: currentPage, section: 0)
      slideScreenCollection.scrollToItem(at: indexPath,
                                         at: .centeredHorizontally,
                                         animated: true)
    }
  }
  
}
