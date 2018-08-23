//
//  DataModel.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 6/13/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class Bird {
    var name: String
    var imageSmall: String
    var imageLarge: String
    var calls: [String]
    var infoLink: String
    var mapLink: String
    
    init(name: String, imageSmall: String, imageLarge: String, calls: [String], infoLink: String, mapLink: String) {
        self.name = name
        self.imageSmall = imageSmall
        self.imageLarge = imageLarge
        self.calls = calls
        self.infoLink = infoLink
        self.mapLink = mapLink
    }
}
