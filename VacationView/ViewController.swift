//
//  ViewController.swift
//  VacationView
//
//  Created by Harry Liu on 5/4/18.
//  Copyright © 2018 Harry Liu. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController {

    var mapView : GMSMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //load API keys
        GMSServices.provideAPIKey("AIzaSyAviVoAgar-bSfw_VcgZwaBCB4k73ZPVc0")
        GMSPlacesClient.provideAPIKey("AIzaSyAviVoAgar-bSfw_VcgZwaBCB4k73ZPVc0")
        
        //set up camera and appropriate map view
        let camera = GMSCameraPosition.camera(withLatitude: 37.349302, longitude: -121.893911, zoom: 12)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let currLocation = CLLocationCoordinate2DMake(37.349302, -121.893911)
        let marker = GMSMarker(position: currLocation)
        marker.title = "San Jose Japantown"
        marker.map = mapView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(self.nextView))
        
    }
    
    @objc func nextView(){
        let nextLocation = CLLocationCoordinate2DMake(37.349056, -121.894805)
        mapView?.camera = GMSCameraPosition.camera(withLatitude: nextLocation.latitude, longitude: nextLocation.longitude, zoom: 18)
        
        let marker = GMSMarker(position: nextLocation)
        marker.title = "Gombei Japanese Restaurant"
        marker.map = mapView
        
    }
    
}

