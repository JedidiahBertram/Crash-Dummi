//
//  ViewControllerBike.swift
//  Crash Dummi
//
//  Created by Jedidiah Bertram on 7/8/17.
//  Copyright © 2017 Jedidiah Bertram. All rights reserved.
//

import UIKit
import CoreLocation
import Mapbox
import Firebase
import FirebaseDatabase


class ViewControllerBike: UIViewController, CLLocationManagerDelegate,  MGLMapViewDelegate {

    @IBOutlet weak var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        CDLocationManager.shared.startLocationUpdates()
        
        mapView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        CDLocationManager.shared.stopLocationUpdates()
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always try to show a callout when an annotation is tapped.
        return true
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        mapView.setCenter((mapView.userLocation?.coordinate)!, animated: false)
        mapView.userTrackingMode = .follow
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
