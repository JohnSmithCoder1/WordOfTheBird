//
//  DataModel.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 6/13/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import Foundation

class Bird {
    var name: String
    var image: String
    var call: String
    var link: String
    init(name: String, image: String, call: String, link: String) {
        self.name = name
        self.image = image
        self.call = call
        self.link = link
    }
}

//  let bird = Bird(name: "Bird", image: "Image", call: "Call", link: "Link")




