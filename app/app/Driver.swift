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
    let image: UIImage
    
    init(title: String, coordinate: CLLocationCoordinate2D, image: UIImage) {
        self.title = title
        self.coordinate = coordinate
        self.image = image
        
        super.init()
    }

}
