//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Eric Liu on 6/12/18.
//  Copyright © 2018 Eric Liu. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
 
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
    }
    
    override func viewDidLoad() {
        print("MapViewController loaded its view.")
        
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satelite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
       
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
}
