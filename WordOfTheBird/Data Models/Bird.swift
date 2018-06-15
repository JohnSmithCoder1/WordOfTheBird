//
//  DataModel.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 6/13/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import Foundation

import UIKit

class Bird {
    var name: String
    var imageSmall: UIImage!
    var imageLarge: UIImage!
    var call: String
    var link: String
    
    init(name: String, imageSmall: UIImage, imageLarge: UIImage, call: String, link: String) {
        self.name = name
        self.imageSmall = imageSmall
        self.imageLarge = imageLarge
        self.call = call
        self.link = link
    }
}




