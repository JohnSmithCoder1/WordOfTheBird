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

let americanGoldfinch = Bird(name: "American Goldfinch",
                             imageSmall: UIImage(named: "americanGoldfinchImageSmall")!,
                             imageLarge: UIImage(named: "americanGoldfinchImageLarge")!,
                             call: "americanGoldfinchCall0",
                             link: "https://en.wikipedia.org/wiki/American_goldfinch")

let americanKestrel = Bird(name: "American Kestrel",
                           imageSmall: UIImage(named: "americanKestrelImageSmall")!,
                           imageLarge: UIImage(named: "americanKestrelImageLarge")!,
                           call: "americanKestrelCall0",
                           link: "https://en.wikipedia.org/wiki/American_kestrel")

let baldEagle = Bird(name: "Bald Eagle",
                     imageSmall: UIImage(named: "baldEagleImageSmall")!,
                     imageLarge: UIImage(named: "baldEagleImageLarge")!,
                     call: "baldEagleCall0",
                     link: "https://en.wikipedia.org/wiki/Bald_eagle")

let barredOwl = Bird(name: "Barred Owl",
                     imageSmall: UIImage(named: "barredOwlImageSmall")!,
                     imageLarge: UIImage(named: "barredOwlImageLarge")!,
                     call: "barredOwlCall0",
                     link: "https://en.wikipedia.org/wiki/Barred_owl")

let blackCappedChickadee = Bird(name: "Black-capped Chickadee",
                                imageSmall: UIImage(named: "blackCappedChickadeeImageSmall")!,
                                imageLarge: UIImage(named: "blackCappedChickadeeImageLarge")!,
                                call: "blackCappedChickadeeCall0",
                                link: "https://en.wikipedia.org/wiki/Black-capped_chickadee")

let blueJay = Bird(name: "Blue Jay",
                   imageSmall: UIImage(named: "blueJayImageSmall")!,
                   imageLarge: UIImage(named: "blueJayImageLarge")!,
                   call: "blueJayCall0",
                   link: "https://en.wikipedia.org/wiki/Blue_jay")

let northernCardinal = Bird(name: "Northern Cardinal",
                    imageSmall: UIImage(named: "cardinalImageSmall")!,
                    imageLarge: UIImage(named: "cardinalImageLarge")!,
                    call: "cardinalCall0",
                    link: "https://en.wikipedia.org/wiki/Northern_cardinal")

let downyWoodpecker = Bird(name: "Downy Woodpecker",
                           imageSmall: UIImage(named: "downyWoodpeckerImageSmall")!,
                           imageLarge: UIImage(named: "downyWoodpeckerImageLarge")!,
                           call: "downyWoodpeckerCall0",
                           link: "https://en.wikipedia.org/wiki/Downy_woodpecker")

let greatHornedOwl = Bird(name: "Great Horned Owl",
                          imageSmall: UIImage(named: "greatHornedOwlImageSmall")!,
                          imageLarge: UIImage(named: "greatHornedOwlImageLarge")!,
                          call: "greatHornedOwlCall0",
                          link: "https://en.wikipedia.org/wiki/Great_horned_owl")

let hairyWoodpecker = Bird(name: "Hairy Woodpecker",
                           imageSmall: UIImage(named: "hairyWoodpeckerImageSmall")!,
                           imageLarge: UIImage(named: "hairyWoodpeckerImageLarge")!,
                           call: "hairyWoodpeckerCall0",
                           link: "https://en.wikipedia.org/wiki/Hairy_woodpecker")

let houseFinch = Bird(name: "House Finch",
                      imageSmall: UIImage(named: "houseFinchImageSmall")!,
                      imageLarge: UIImage(named: "houseFinchImageLarge")!,
                      call: "houseFinchCall0",
                      link: "https://en.wikipedia.org/wiki/House_finch")

let northernFlicker = Bird(name: "Northern Flicker",
                           imageSmall: UIImage(named: "northernFlickerImageSmall")!,
                           imageLarge: UIImage(named: "northernFlickerImageLarge")!,
                           call: "northernFlickerCall0",
                           link: "https://en.wikipedia.org/wiki/Northern_flicker")

let peregrineFalcon = Bird(name: "Peregrine Falcon",
                           imageSmall: UIImage(named: "peregrineFalconImageSmall")!,
                           imageLarge: UIImage(named: "peregrineFalconImageLarge")!,
                           call: "peregrineFalconCall0",
                           link: "https://en.wikipedia.org/wiki/Peregrine_falcon")

let pileatedWoodpecker = Bird(name: "Pileated Woodpecker",
                              imageSmall: UIImage(named: "pileatedWoodpeckerImageSmall")!,
                              imageLarge: UIImage(named: "pileatedWoodpeckerImageLarge")!,
                              call: "pileatedWoodpeckerCall0",
                              link: "https://en.wikipedia.org/wiki/Pileated_woodpecker")

let redBelliedWoodpecker = Bird(name: "Red-bellied Woodpecker",
                                imageSmall: UIImage(named: "redBelliedWoodpeckerImageSmall")!,
                                imageLarge: UIImage(named: "redBelliedWoodpeckerImageLarge")!,
                                call: "redBelliedWoodpeckerCall0",
                                link: "https://en.wikipedia.org/wiki/Red-bellied_woodpecker")

let redHeadedWoodpecker = Bird(name: "Red-headed Woodpecker",
                               imageSmall: UIImage(named: "redHeadedWoodpeckerImageSmall")!,
                               imageLarge: UIImage(named: "redHeadedWoodpeckerImageLarge")!,
                               call: "redHeadedWoodpeckerCall0",
                               link: "https://en.wikipedia.org/wiki/Red-headed_woodpecker")

let redTailedHawk = Bird(name: "Red-tailed Hawk",
                         imageSmall: UIImage(named: "redTailedHawkImageSmall")!,
                         imageLarge: UIImage(named: "redTailedHawkImageLarge")!,
                         call: "redTailedHawkCall0",
                         link: "https://en.wikipedia.org/wiki/Red-tailed_hawk")

let tuftedTitmouse = Bird(name: "Tufted Titmouse",
                          imageSmall: UIImage(named: "tuftedTitmouseImageSmall")!,
                          imageLarge: UIImage(named: "tuftedTitmouseImageLarge")!,
                          call: "tuftedTitmouseCall0",
                          link: "https://en.wikipedia.org/wiki/Tufted_titmouse")

let birdArray = [americanGoldfinch, americanKestrel, baldEagle, barredOwl, blackCappedChickadee, blueJay, downyWoodpecker, greatHornedOwl, hairyWoodpecker, houseFinch, northernCardinal, northernFlicker, peregrineFalcon, pileatedWoodpecker, redBelliedWoodpecker, redHeadedWoodpecker, redTailedHawk, tuftedTitmouse]



