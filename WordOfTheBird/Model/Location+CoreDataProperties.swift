//
//  Location+CoreDataProperties.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 9/5/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//
//

import CoreData
import CoreLocation

extension Location {
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var date: Date
    @NSManaged public var locationDescription: String
    @NSManaged public var category: String
    @NSManaged public var placemark: CLPlacemark?
    @NSManaged public var photoID: NSNumber?
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }
}
