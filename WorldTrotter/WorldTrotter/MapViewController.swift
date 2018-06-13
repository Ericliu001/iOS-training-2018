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
    
    fileprivate func extractedFunc() -> UISegmentedControl {
        let segmentedControl =  UISegmentedControl(items: ["Standard", "Hybrid", "Satelite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
    }
    
    override func viewDidLoad() {
        print("MapViewController loaded its view.")
        
        
        let segmentedControl = extractedFunc()
        
        view.addSubview(segmentedControl)
       
        setupConstraints(segmentedControl)
        
        addListener(segmentedControl)
    }
    
    func addListener(_ segmentedControl: UISegmentedControl){
        segmentedControl.addTarget(self,
                                   action: #selector(MapViewController.mapTypeChanged(_:)),
                                   for: .valueChanged)
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break }
    }
    
    func setupConstraints(_ segmentedControl: UIView){
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15.0)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
}
