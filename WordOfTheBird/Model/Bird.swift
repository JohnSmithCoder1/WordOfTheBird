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
    var call1: String
    var call2: String
    var wikiLink: String
    
    init(name: String, imageSmall: String, imageLarge: String, call1: String, call2: String, wikiLink: String) {
        self.name = name
        self.imageSmall = imageSmall
        self.imageLarge = imageLarge
        self.call1 = call1
        self.call2 = call2
        self.wikiLink = wikiLink
    }
}
