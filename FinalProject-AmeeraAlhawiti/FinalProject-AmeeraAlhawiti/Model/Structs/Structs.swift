
import UIKit

//MARK: - struct for collection make bouquets
struct Flowers {
  let imageOfFlower: UIImage
  let priceOfFlower: Double
  let flowerName: String
}


//MARK: - struct for collection all bouquets
struct Bouquets {
  let imageOfBouquet: UIImage
  let price: Double
  let imageName: String
}


//MARK: - struct for get data from firebase
struct MyData {
  let image: String
  let price: Double
  let imageName: String
}


//MARK: - struct for table in shop cart
struct Products {
  let image: UIImage
  let name: String
  let price: Double
}


//MARK: - struct for table in Favoraite page
struct ProductsForFavoraite {
  let image: UIImage
  let name: String
  let price: Double
}


//MARK: - sruct for get info 
struct MyBouquet {
  let image: String
  let price: Double
  let name: String
  
  func getInfo() -> [String:Any]{
      return ["image":image,"price":price,"name":name,] as! [String:Any]
  }
}

//MARK: - struct for get show data in cart and favorait table
struct ShowData{
  var image: String
  var price: String
  var name: String
}


struct Favorite:Hashable {
  let price : Double
  let bouqetName : String
  let Image : String
  func getBpuqetInfo() -> [String:Any]{
    return ["price":price,
     "bouqetName":bouqetName,
     "Image":Image] as! [String:Any]
  }
}
