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
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    var body: some View {
        
        Text("left").position(x:UIScreen.main.bounds.width/2-100, y:UIScreen.main.bounds.height/2+100)
        Text("right").position(x:UIScreen.main.bounds.width/2+100, y:UIScreen.main.bounds.height/2)
        Map(coordinateRegion: $region).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-500).position(x:UIScreen.main.bounds.width/2, y:-300)
        
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
