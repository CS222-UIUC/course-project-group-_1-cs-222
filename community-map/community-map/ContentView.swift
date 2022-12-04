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
    
    @State private var motionClass = Motion()
    @State private var message = "-"

    var body: some View {
        
        VStack {
                    Button("Run") {
                        print("Tapped!")
                        
                        OperationQueue().addOperation {
                            for i in 0 ... 100 {

                                OperationQueue.main.addOperation {
                                    motionClass.startAccelerometer()
                                    motionClass.startGyros()
                                    self.message = String(motionClass.valuesArray.first?.0 ?? 0.0)
                                    print(i, self.message)
                                    
                                }
                                sleep(1)
                            }

                        }
                    }

                    Text(message)
                        .frame(width: 100)
                        .padding()
                }
                .padding(40)
        
        Map(coordinateRegion: $region).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        Text("center").frame(
            
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .bottom)
//        Text("right").position(x:UIScreen.main.bounds.width/2+100, y:UIScreen.main.bounds.height/2)
        
            
        
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

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
