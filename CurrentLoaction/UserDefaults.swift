//
//  UserDefaults.swift
//  CurrentLoaction
//
//  Created by SMSCountry Networks Pvt. Ltd on 10/10/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import Foundation
import UIKit


class UserDefaultStore: NSObject {
    class var currentCity : String! {
        
        get{
            if let did = UserDefaults.standard.object(forKey: "currentCity"){
                return did as? String
            }
            return nil
        }
        set(newVal){
            UserDefaults.standard.set(newVal, forKey: "currentCity")
        }
    }
    
    
    
    class var isAutoUpdateLocation : String?{
        
        get{
            if let did = UserDefaults.standard.object(forKey: "isAutoUpdateLocation"){
                return did as? String
            }
            return nil
        }
        set(newVal){
            UserDefaults.standard.set(newVal, forKey: "isAutoUpdateLocation")
        }
    }
    
}


class JumanConstants: NSObject {
    
    static let Appdelegate = UIApplication.shared.delegate as? AppDelegate
}








//
//class ViewController: UIViewController,CLLocationManagerDelegate {
//    
//    @IBOutlet var lblofUserLocation: UILabel!
//    
//    var LocationLatitue : String! = ""
//    var LocationLongitude : String! = ""
//    var locationManager = CLLocationManager()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        //        locationManager.delegate = self
//        //        locationManager.requestWhenInUseAuthorization()
//        //        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        //        locationManager.startUpdatingLocation()
//        //        locationManager.startMonitoringSignificantLocationChanges()
//        //        // Here you can check whether you have allowed the permission or not.
//        //        if CLLocationManager.locationServicesEnabled()
//        //        {
//        //            switch(CLLocationManager.authorizationStatus())
//        //            {
//        //            case .authorizedAlways, .authorizedWhenInUse:
//        //                print("Authorize.")
//        //                let latitude: CLLocationDegrees = (locationManager.location?.coordinate.latitude)!
//        //                let longitude: CLLocationDegrees = (locationManager.location?.coordinate.longitude)!
//        //                let location = CLLocation(latitude: latitude, longitude: longitude) //changed!!!
//        //                CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
//        //                    if error != nil {
//        //                        //            print("Unable to Reverse Geocode Location (\(error))")
//        //                        //  locationLabel.text = "Unable to Find Address for Location"
//        //
//        //                    } else {
//        //                        if let placemarks = placemarks, let placemark = placemarks.first {
//        //                            self.lblofUserLocation.text = (placemark.locality)!
//        //                            print(placemark.locality ?? "")
//        //                        }
//        //                    }
//        //
//        //                })
//        //                break
//        //
//        //            case .notDetermined:
//        //                print("Not determined.")
//        //                self.showAlertMessage(messageTitle: "Bolo Board", withMessage: "Location service is disabled!!")
//        //                break
//        //
//        //            case .restricted:
//        //                print("Restricted.")
//        //                self.showAlertMessage(messageTitle: "Bolo Board", withMessage: "Location service is disabled!!")
//        //                break
//        //
//        //            case .denied:
//        //                print("Denied.")
//        //            }
//        //        }
//        
//    }
//    
//    func showAlertMessage(messageTitle: NSString, withMessage: NSString) ->Void  {
//        let alertController = UIAlertController(title: messageTitle as String, message: withMessage as String, preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
//            
//        }
//        alertController.addAction(cancelAction)
//        
//        let OKAction = UIAlertAction(title: "Settings", style: .default) { (action:UIAlertAction!) in
//            if let url = URL(string: "App-Prefs:root=Privacy&path=LOCATION/com.company.AppName") {
//                if #available(iOS 10.0, *) {
//                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                } else {
//                    // Fallback on earlier versions
//                }
//            }
//        }
//        alertController.addAction(OKAction)
//        self.present(alertController, animated: true, completion:nil)
//    }
//    
//    @IBAction func btnGetcurrentLocationClicked(_ sender: Any) {
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startUpdatingLocation()
//        locationManager.startMonitoringSignificantLocationChanges()
//        // Here you can check whether you have allowed the permission or not.
//        if CLLocationManager.locationServicesEnabled()
//        {
//            switch(CLLocationManager.authorizationStatus())
//            {
//            case .authorizedAlways, .authorizedWhenInUse:
//                print("Authorize.")
//                let latitude: CLLocationDegrees = (locationManager.location?.coordinate.latitude)!
//                let longitude: CLLocationDegrees = (locationManager.location?.coordinate.longitude)!
//                let location = CLLocation(latitude: latitude, longitude: longitude) //changed!!!
//                CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
//                    if error != nil {
//                        //            print("Unable to Reverse Geocode Location (\(error))")
//                        //  locationLabel.text = "Unable to Find Address for Location"
//                        
//                    } else {
//                        if let placemarks = placemarks, let placemark = placemarks.first {
//                            self.lblofUserLocation.text = (placemark.locality)!
//                            print(placemark.locality ?? "")
//                        }
//                    }
//                    
//                })
//                break
//                
//            case .notDetermined:
//                print("Not determined.")
//                self.showAlertMessage(messageTitle: "Bolo Board", withMessage: "Location service is disabled!!")
//                break
//                
//            case .restricted:
//                print("Restricted.")
//                self.showAlertMessage(messageTitle: "Bolo Board", withMessage: "Location service is disabled!!")
//                break
//                
//            case .denied:
//                print("Denied.")
//            }
//        }
//        
//    }
//    
//}
