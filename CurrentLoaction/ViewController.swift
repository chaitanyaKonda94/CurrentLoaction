//
//  ViewController.swift
//  CurrentLoaction
//
//  Created by SMSCountry Networks Pvt. Ltd on 10/10/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController,CLLocationManagerDelegate {
        
        @IBOutlet var lblofUserLocation: UILabel!
        
        var LocationLatitue : String! = ""
        var LocationLongitude : String! = ""
        var locationManager = CLLocationManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
    
        
        @IBAction func btnGetcurrentLocationClicked(_ sender: Any) {
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            locationManager.startMonitoringSignificantLocationChanges()
            // Here you can check whether you have allowed the permission or not.
            if CLLocationManager.locationServicesEnabled()
            {
                switch(CLLocationManager.authorizationStatus())
                {
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Authorize.")
                    let latitude: CLLocationDegrees = (locationManager.location?.coordinate.latitude)!
                    let longitude: CLLocationDegrees = (locationManager.location?.coordinate.longitude)!
                    let location = CLLocation(latitude: latitude, longitude: longitude) //changed!!!
                    CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                        if error != nil {
                            //            print("Unable to Reverse Geocode Location (\(error))")
                            //  locationLabel.text = "Unable to Find Address for Location"
                            
                        } else {
                            if let placemarks = placemarks, let placemark = placemarks.first {
                                self.lblofUserLocation.text = String(placemark.name ?? "") + "," + String(placemark.locality ?? "") + "," + String(placemark.country ?? "")
                                print(placemark.locality ?? "")
                            }
                        }
                        
                    })
                    break
                    
                case .notDetermined:
                    print("Not determined.")
                    self.showAlertMessage(messageTitle: "Bolo Board", withMessage: "Location service is disabled!!")
                    break
                    
                case .restricted:
                    print("Restricted.")
                    self.showAlertMessage(messageTitle: "Bolo Board", withMessage: "Location service is disabled!!")
                    break
                    
                case .denied:
                    print("Denied.")
                }
            }
            
        }
    
    func showAlertMessage(messageTitle: NSString, withMessage: NSString) ->Void  {
        let alertController = UIAlertController(title: messageTitle as String, message: withMessage as String, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Settings", style: .default) { (action:UIAlertAction!) in
            if let url = URL(string: "App-Prefs:root=Privacy&path=LOCATION/com.company.AppName") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
}













//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        lblofUserLocation.text = UserDefaultStore.currentCity
//    }
//
//
//    func getuserCurrentLocationName(){
//
//        //check if user cuurent location is enable or not
//        //  CHECK IF LOCATION SERVICE IS ENABLE OR NOT
//        if CLLocationManager.locationServicesEnabled() {
//
//            let delegateApp = JumanConstants.Appdelegate as! AppDelegate
//            if delegateApp.AppLocationLatitue != "" && delegateApp.AppLocationLongitude != "" {
//                getAddressofLocation(delegateApp.AppLocationLatitue, delegateApp.AppLocationLongitude)
//
//            }
//
//        }
//    }
//
//
//
//    func getAddressofLocation(_ latitude : String ,_ longitude : String) {
//
//        guard let latitude = Double(latitude) else { return }
//        guard let longitude = Double(longitude) else { return }
//
//        let location = CLLocation(latitude: latitude, longitude: longitude)
//
//        let geocoder = CLGeocoder()
//        // Geocode Location
//        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
//            // Process Response
//            self.processResponse(withPlacemarks: placemarks, error: error)
//        }
//
//    }
//
//    func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
//        // Update View
//
//        if error != nil {
//            //            print("Unable to Reverse Geocode Location (\(error))")
//            //  locationLabel.text = "Unable to Find Address for Location"
//
//        } else {
//            if let placemarks = placemarks, let placemark = placemarks.first {
//
//              UserDefaultStore.currentCity = String(placemark.name ?? "") + "," + String(placemark.country ?? "")
//                lblofUserLocation.text = String(placemark.name ?? "") + "," + String(placemark.locality ?? "") + "," + String(placemark.country ?? "")
//               // print(placemark.name ?? "")
//                  UserDefaultStore.isAutoUpdateLocation = "0"
//
//            } else {
//
//            }
//        }
//    }
//
//
//    func checkLocationServiceEnable() -> String {
//
//        if CLLocationManager.locationServicesEnabled() {
//
//            switch CLLocationManager.authorizationStatus() {
//
//            case .notDetermined:
//
//                //                print("No access")
//
//                return "0"
//
//            case .authorizedAlways, .authorizedWhenInUse:
//
//                //                print("Access")
//
//                return "1"
//
//            case .restricted, .denied:
//
//                //                print("restricted")
//
//                return "2"
//
//            }
//
//        } else {
//
//            //            print("Location services are not enabled")
//
//            return "2"
//
//        }
//
//    }
//
//
//
//
//
//    @IBAction func btnGetcurrentLocationClicked(_ sender: Any) {
//
//        if checkLocationServiceEnable() == "0"  {
//            let delegateApp = JumanConstants.Appdelegate
//            delegateApp?.accessUserCurrentLocation()
//           self.getuserCurrentLocationName()
//
//        } else
//
//        if checkLocationServiceEnable() == "1"  {
//
//
//            let delegateApp = JumanConstants.Appdelegate
//            delegateApp?.accessUserCurrentLocation()
//          UserDefaultStore.isAutoUpdateLocation = "0"
//
//
//            Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { (timerobj) in
//                if delegateApp?.AppLocationLatitue != "" && delegateApp?.AppLocationLongitude != "" {
//                    self.getuserCurrentLocationName()
//                    timerobj.invalidate()
//
//                }
//            })
//
//        } else   if checkLocationServiceEnable() == "2" {
//
//        }
//
//    }
//}
//
