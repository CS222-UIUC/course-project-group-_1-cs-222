//
//  SessionViewController.swift
//  community-map-release-1.0
//
//  Created by Kushal Agarwal on 12/5/22.
//

import Foundation


//
//  SessionViewController.swift
//  community-map-final
//
//  Created by Varun Giridhar on 04/12/22.
//

import Foundation
import UIKit
import CoreMotion
import MapKit
import CoreLocation

class SessionViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var potholeCollection = [pothole()]
    override func viewDidLoad() {
        super.viewDidLoad()
        let locationManager = CLLocationManager()
        plotPoints(locationManager)
        
        print(potholeCollection)
    }
    

    func plotPoints(_ manager: CLLocationManager) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        mapView.mapType = MKMapType.standard

        let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let region = MKCoordinateRegion(center: locValue, span: span)
        
        mapView.setRegion(region, animated: true)
        for collection in potholeCollection {
            let annotation = MKPointAnnotation()
            var lat = collection.lat
            var lon = collection.lon
            annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            annotation.title = "Pothole"
            mapView.addAnnotation(annotation)
            
        }
        
    }
}
