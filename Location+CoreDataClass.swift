//
//  Location+CoreDataClass.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 9/5/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//
//

import Foundation
import MapKit
import CoreData

@objc(Location)
public class Location: NSManagedObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    public var title: String? {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
    }
    
    public var subtitle: String? {
        return category
    }
}
