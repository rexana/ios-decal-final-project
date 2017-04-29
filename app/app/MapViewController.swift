//
//  ViewController.swift
//  app
//
//  Created by Rexana Church on 4/13/17.
//  Copyright © 2017 Rexana Church. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let regionRadius: CLLocationDistance = 1000
    var pointAnnotation:CustomPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mapView.showsUserLocation = true
        
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMapOnLocation(location: initialLocation)
        
        // show driver on map
//        let driver = Driver(title: "Cecilia Şenocak", coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        
        // Custom pin not working
        pointAnnotation = CustomPointAnnotation()
        pointAnnotation.pinCustomImageName = "OrangeLocationPin"
        pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661)
        pointAnnotation.title = "Cecilia Şenocak"
        
        pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: "pin")
        mapView.addAnnotation(pinAnnotationView.annotation!)
        
//        mapView.addAnnotation(driver)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    // MARK: - location manager to authorize user location for Maps app
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
        mapView.userTrackingMode = .follow
    }
    
    // MARK: - Custom Annotation
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        let customPointAnnotation = annotation as! CustomPointAnnotation
        annotationView?.image = UIImage(named: customPointAnnotation.pinCustomImageName!)
        
        return annotationView
    }

}

