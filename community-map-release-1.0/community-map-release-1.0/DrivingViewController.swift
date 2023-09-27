//
//  DrivingViewController.swift
//  community-map-release-1.0
//
//  Created by Kushal Agarwal on 12/5/22.
//

import Foundation
import UIKit
import CoreMotion
import MapKit
import CoreLocation

struct pothole {
    var lat = 0.0
    var lon = 0.0
    var gyroX = 0.0
    var gyroY = 0.0
    var gyroZ = 0.0
    var accelX = 0.0
    var accelY = 0.0
    var accelZ = 0.0
    
}

class DrivingViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {

//
//
    @IBOutlet weak var accelX: UILabel!
    @IBOutlet weak var accelY: UILabel!
    @IBOutlet weak var accelZ: UILabel!

    @IBOutlet weak var gyroX: UILabel!
    @IBOutlet weak var gyroY: UILabel!
    @IBOutlet weak var gyroZ: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func viewCollection() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "session") as! SessionViewController
                vc.potholeCollection = potholesInSession
                self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // constants and variable definitions
    
    var motion = CMMotionManager()
    let locationManager = CLLocationManager()
    var localGyroData: [Character: Double] = ["x": 0.0,
                                          "y": 0.0,
                                          "z": 0.0]
    var localAccelData: [Character: Double] = ["x": 0.0,
                                          "y": 0.0,
                                          "z": 0.0]
    
    
    var potholesInSession: [pothole] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runGyroscope()
        runAccelerometer()
        self.locationManager.requestAlwaysAuthorization()

            // For use in foreground
            self.locationManager.requestWhenInUseAuthorization()

            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }

            mapView.delegate = self
            mapView.mapType = .standard
            mapView.isZoomEnabled = true
            mapView.isScrollEnabled = true

            if let coor = mapView.userLocation.location?.coordinate{
                mapView.setCenter(coor, animated: true)
            }
        print("driving view controller")
    }
    
    func runGyroscope() {
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let gyroData = data {
                self.gyroX.text = "\(gyroData.rotationRate.x)"
                self.gyroY.text = "\(gyroData.rotationRate.y)"
                self.gyroZ.text = "\(gyroData.rotationRate.z)"
                self.localGyroData["x"] = gyroData.rotationRate.x
                self.localGyroData["y"] = gyroData.rotationRate.y
                self.localGyroData["z"] = gyroData.rotationRate.z
                
            }
        }
    }
    
    func runAccelerometer() {
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!){ (data, error) in
            if let accelData = data {
                self.accelX.text = "\(accelData.acceleration.x)"
                self.accelY.text = "\(accelData.acceleration.y)"
                self.accelZ.text = "\(accelData.acceleration.z)"
                self.localAccelData["x"] = accelData.acceleration.x
                self.localAccelData["y"] = accelData.acceleration.y
                self.localAccelData["z"] = accelData.acceleration.z
            }
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate

        mapView.mapType = MKMapType.standard

        let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)
        print(localAccelData["y"])
        if (localGyroData["y"]! > 0.3 || localGyroData["y"]! < -0.3) {
            print ("pothole found")
            let annotation = MKPointAnnotation()
            annotation.coordinate = locValue
            annotation.title = "Pothole"
            annotation.subtitle = manager.location?.description
            mapView.addAnnotation(annotation)
            
            let lat = Double(locValue.latitude)
            let lon = Double(locValue.longitude)
            
            
            self.potholesInSession.append(pothole(lat: lat,
                                                  lon: lon,
                                                  gyroX: localGyroData["x"] ?? 0.0,
                                                  gyroY: localGyroData["y"] ?? 0.0,
                                                  gyroZ: localGyroData["z"] ?? 0.0,
                                                  accelX: localAccelData["x"] ?? 0.0,
                                                  accelY: localAccelData["y"] ?? 0.0,
                                                  accelZ: localAccelData["z"] ?? 0.0))
        }
        
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        // Create a variable to store the name the user entered on textField
//        let nickName = "VAR"
//        // Create a new variable to store the instance of the SecondViewController
//        // set the variable from the SecondViewController that will receive the data
//        let destinationVC = segue.destination as! SessionViewController
//        destinationVC.nickName = nickName
//    }


}
