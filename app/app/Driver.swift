//
//  Driver.swift
//  app
//
//  Created by Rexana Church on 4/13/17.
//  Copyright © 2017 Rexana Church. All rights reserved.
//

import Foundation
import MapKit

class Driver: NSObject, MKAnnotation {
    let title: String?
    var subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }

}
