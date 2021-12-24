//
//  AboutUsPage.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 21/12/2021.
//

import UIKit

class AboutUsPage: UIViewController {
  
  @IBOutlet weak var clearButton:UIButton!

  @IBOutlet weak var aboutUsText:UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    clearButton.layer.borderWidth = 0.2
    clearButton.layer.borderColor = UIColor.gray.cgColor
    clearButton.layer.cornerRadius = 8
    
    
    aboutUsText.text = """
   Rosé app has the experience of online flower delivery . Birthdays, graduations, promotions, weddings, anniversaries, baby showers, Mother's day, bridal showers, business launches – no matter what you are celebrating, it cannot be complete without flowers ! Flowers bring smile and joy every time you receive or send them.

   moment. Nothing is better than sending flowers as a reminder of your love, concern or simply making anybody's day brighter.

  Know our story:
    At Rosé app , we believe that sending flowers is simply the best way to express your feeling, celebrate or just being thoughtful!!

    We bring you the very best flowers available, for that perfect bouquet for any season, for celebrating any milestone, or just because you are thinking about that person. We make sure that the flowers remain fresh and bright, full of fragrance when they are delivered. Our bouquets are hand-arranged, and hand delivered, making sure of their freshness. We make it easy to send flowers by simply clicking of a button. For last minute gift.

  Rosé was founded by Ameera Alhawiti , ensure that we bring the maximum efficiency, exquisite aesthetics, competent technology, and affordable prices to our valued customers. With the help of our powerful set-up and Florist stores. RoseApp offers a wide range of services that are backed by the optimal utilization of our resources. We use advanced technology-based systems to reach our customers and their necessities.
    We deliver on time and we do it efficiently. We are dedicated to maintaining authentic vendor management policy along with the modern technologies. We strive to offer our customers the quality products at affordable prices.

"""
    
  }
  
  @IBAction func clearPressed(_ sender: UIButton){
    self.dismiss(animated: true, completion: nil)
  }
  
  
}
