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

let americanGoldfinch = Bird(name: "American Goldfinch", image: "americanGoldfinchImageSmall", call: "americanGoldfinchCall0", link: "https://en.wikipedia.org/wiki/American_goldfinch")

let americanKestrel = Bird(name: "American Kestrel", image: "americanKestrelImageSmall", call: "americanKestrelCall0", link: "https://en.wikipedia.org/wiki/American_kestrel")

let baldEagle = Bird(name: "Bald Eagle", image: "baldEagleImageSmall", call: "baldEagleCall0", link: "https://en.wikipedia.org/wiki/Bald_eagle")

let barredOwl = Bird(name: "Barred Owl", image: "barredOwlImageSmall", call: "barredOwlCall0", link: "https://en.wikipedia.org/wiki/Barred_owl")

let blackcappedChickadee = Bird(name: "Black-capped Chickadee", image: "blackcappedChickadeeImageSmall", call: "blackcappedChickadeeCall0", link: "https://en.wikipedia.org/wiki/Black-capped_chickadee")

let blueJay = Bird(name: "Blue Jay", image: "blueJayImageSmall", call: "blueJayCall0", link: "https://en.wikipedia.org/wiki/Blue_jay")

let cardinal = Bird(name: "Cardinal", image: "cardinalImageSmall", call: "cardinalCall0", link: "https://en.wikipedia.org/wiki/Cardinal_(bird)")

let downyWoodpecker = Bird(name: "Downy Woodpecker", image: "downyWoodpeckerImageSmall", call: "downyWoodpeckerCall0", link: "https://en.wikipedia.org/wiki/Downy_woodpecker")

let greatHornedOwl = Bird(name: "Great Horned Owl", image: "greatHornedOwlImageSmall", call: "greatHornedOwlCall0", link: "https://en.wikipedia.org/wiki/Great_horned_owl")

let hairyWoodpecker = Bird(name: "Hairy Woodpecker", image: "hairyWoodpeckerImageSmall", call: "hairyWoodpeckerCall0", link: "https://en.wikipedia.org/wiki/Hairy_woodpecker")

let houseFinch = Bird(name: "House Finch", image: "houseFinchImageSmall", call: "houseFinchCall0", link: "https://en.wikipedia.org/wiki/House_finch")

let northernFlicker = Bird(name: "Northern Flicker", image: "northernFlickerImageSmall", call: "northernFlickerCall0", link: "https://en.wikipedia.org/wiki/Northern_flicker")

let peregrineFalcon = Bird(name: "Peregrine Falcon", image: "peregrineFalconImageSmall", call: "peregrineFalconCall0", link: "https://en.wikipedia.org/wiki/Peregrine_falcon")

let pileatedWoodpecker = Bird(name: "Pileated Woodpecker", image: "pileatedWoodpeckerImageSmall", call: "pileatedWoodpeckerCall0", link: "https://en.wikipedia.org/wiki/Pileated_woodpecker")

let redBelliedWoodpecker = Bird(name: "Red-bellied Woodpecker", image: "redBelliedWoodpeckerImageSmall", call: "redBelliedWoodpeckerCall0", link: "https://en.wikipedia.org/wiki/Red-bellied_woodpecker")

let redHeadedWoodpecker = Bird(name: "Red-headed Woodpecker", image: "redHeadedWoodpeckerImageSmall", call: "redHeadedWoodpeckerCall0", link: "https://en.wikipedia.org/wiki/Red-headed_woodpecker")

let redTailedHawk = Bird(name: "Red-tailed Hawk", image: "redTailedHawkImageSmall", call: "redTailedHawkCall0", link: "https://en.wikipedia.org/wiki/Red-tailed_hawk")

let tuftedTitmouse = Bird(name: "Tufted Titmouse", image: "tuftedTitmouseImageSmall", call: "tuftedTitmouseCall0", link: "https://en.wikipedia.org/wiki/Tufted_titmouse")


