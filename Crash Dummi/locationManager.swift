//
//  locationManager.swift
//  Crash Dummi
//
//  Created by Jedidiah Bertram on 7/8/17.
//  Copyright © 2017 Jedidiah Bertram. All rights reserved.
//

import UIKit
import CoreLocation

class CDLocationManager: NSObject {

    //MARK: - Properties
    
    static var shared: CDLocationManager = CDLocationManager()
    
    fileprivate var locationManager: CLLocationManager = CLLocationManager()

    override init() {
        super.init()
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .restricted {
            //add logic here
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 15
        locationManager.delegate = self
        
    }
    
    // MARK: - Methods
    
    func startLocationUpdates() {
        locationManager.startUpdatingLocation()
    }
    
    func stopLocationUpdates() {
        locationManager.stopUpdatingLocation()
    }

}

extension CDLocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // add logic here
        if let currentLocation = locations.last {
            print(currentLocation)
        } else {
            print("No locations yet")
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // add logic here
    }
}
