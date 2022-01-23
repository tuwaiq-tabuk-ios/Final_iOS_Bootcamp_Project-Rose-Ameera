//
//  UserProfileAddress.swift
//  FinalProject-AmeeraAlhawiti
//
//  Created by Ameera BA on 27/12/2021.
//

import UIKit
import MapKit
import CoreLocation

class UserProfileAddress: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {


  
  var mapView = MKMapView()
  var userLocation = CLLocationManager()
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      print("MapViewController loaded its view.")
      userLocation.delegate = self
      mapView.delegate = self
      mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
      locationManagerDidChangeAuthorization(userLocation)
    }
  
  // View map
  override func loadView() {
    view = mapView
  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    if userLocation.authorizationStatus == .notDetermined{
      userLocation.requestWhenInUseAuthorization()
    } else {
      userLocation.requestAlwaysAuthorization()
    }
  }
  
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    let span = MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
    let theRegion = MKCoordinateRegion(center: userLocation.coordinate, span: span)
    mapView.setRegion(theRegion, animated: true)
  }
}
