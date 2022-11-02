//
//  ContentView.swift
//  community-map
//
//  Created by Varun Giridhar on 09/10/22.
//

import SwiftUI
import UIKit
import MapKit
import CoreLocation

public var onGoing = false
var valuesArray: [(Double, Double, Double)] = []

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        
        Text("left").position(x:100, y:600)
        Text("right").position(x:300, y:217)
        Map(coordinateRegion: $region).frame(width: 400, height: 300).position(x:0, y:0)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
//    super.viewDidLoad()
}
