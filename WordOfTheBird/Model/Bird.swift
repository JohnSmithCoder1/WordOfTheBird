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

let birdArray = [Bird(name: "American Goldfinch",
                  imageSmall: "americanGoldfinchImageSmall",
                  imageLarge: "americanGoldfinchImageLarge",
                  call1: "americanGoldfinchCall1",
                  call2: "americanGoldfinchCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/American_goldfinch"),
             Bird(name: "American Kestrel",
                  imageSmall: "americanKestrelImageSmall",
                  imageLarge: "americanKestrelImageLarge",
                  call1: "americanKestrelCall1",
                  call2: "americanKestrelCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/American_kestrel"),
             Bird(name: "Bald Eagle",
                  imageSmall: "baldEagleImageSmall",
                  imageLarge: "baldEagleImageLarge",
                  call1: "baldEagleCall1",
                  call2: "baldEagleCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Bald_eagle"),
             Bird(name: "Barred Owl",
                  imageSmall: "barredOwlImageSmall",
                  imageLarge: "barredOwlImageLarge",
                  call1: "barredOwlCall1",
                  call2: "barredOwlCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Barred_owl"),
             Bird(name: "Black-capped Chickadee",
                  imageSmall: "blackCappedChickadeeImageSmall",
                  imageLarge: "blackCappedChickadeeImageLarge",
                  call1: "blackCappedChickadeeCall1",
                  call2: "blackCappedChickadeeCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Black-capped_chickadee"),
             Bird(name: "Blue Jay",
                  imageSmall: "blueJayImageSmall",
                  imageLarge: "blueJayImageLarge",
                  call1: "blueJayCall1",
                  call2: "blueJayCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Blue_jay"),
             Bird(name: "Northern Cardinal",
                  imageSmall: "cardinalImageSmall",
                  imageLarge: "cardinalImageLarge",
                  call1: "cardinalCall1",
                  call2: "cardinalCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Northern_cardinal"),
             Bird(name: "Downy Woodpecker",
                  imageSmall: "downyWoodpeckerImageSmall",
                  imageLarge: "downyWoodpeckerImageLarge",
                  call1: "downyWoodpeckerCall1",
                  call2: "downyWoodpeckerCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Downy_woodpecker"),
             Bird(name: "Great Horned Owl",
                  imageSmall: "greatHornedOwlImageSmall",
                  imageLarge: "greatHornedOwlImageLarge",
                  call1: "greatHornedOwlCall1",
                  call2: "greatHornedOwlCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Great_horned_owl"),
             Bird(name: "Hairy Woodpecker",
                  imageSmall: "hairyWoodpeckerImageSmall",
                  imageLarge: "hairyWoodpeckerImageLarge",
                  call1: "hairyWoodpeckerCall1",
                  call2: "hairyWoodpeckerCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Hairy_woodpecker"),
             Bird(name: "House Finch",
                  imageSmall: "houseFinchImageSmall",
                  imageLarge: "houseFinchImageLarge",
                  call1: "houseFinchCall1",
                  call2: "houseFinchCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/House_finch"),
             Bird(name: "Northern Flicker",
                  imageSmall: "northernFlickerImageSmall",
                  imageLarge: "northernFlickerImageLarge",
                  call1: "northernFlickerCall1",
                  call2: "northernFlickerCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Northern_flicker"),
             Bird(name: "Peregrine Falcon",
                  imageSmall: "peregrineFalconImageSmall",
                  imageLarge: "peregrineFalconImageLarge",
                  call1: "peregrineFalconCall1",
                  call2: "peregrineFalconCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Peregrine_falcon"),
             Bird(name: "Pileated Woodpecker",
                  imageSmall: "pileatedWoodpeckerImageSmall",
                  imageLarge: "pileatedWoodpeckerImageLarge",
                  call1: "pileatedWoodpeckerCall1",
                  call2: "pileatedWoodpeckerCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Pileated_woodpecker"),
             Bird(name: "Red-bellied Woodpecker",
                  imageSmall: "redBelliedWoodpeckerImageSmall",
                  imageLarge: "redBelliedWoodpeckerImageLarge",
                  call1: "redBelliedWoodpeckerCall1",
                  call2: "redBelliedWoodpeckerCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Red-bellied_woodpecker"),
             Bird(name: "Red-headed Woodpecker",
                  imageSmall: "redHeadedWoodpeckerImageSmall",
                  imageLarge: "redHeadedWoodpeckerImageLarge",
                  call1: "redHeadedWoodpeckerCall1",
                  call2: "redHeadedWoodpeckerCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Red-headed_woodpecker"),
             Bird(name: "Red-tailed Hawk",
                  imageSmall: "redTailedHawkImageSmall",
                  imageLarge: "redTailedHawkImageLarge",
                  call1: "redTailedHawkCall1",
                  call2: "redTailedHawkCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Red-tailed_hawk"),
             Bird(name: "Tufted Titmouse",
                  imageSmall: "tuftedTitmouseImageSmall",
                  imageLarge: "tuftedTitmouseImageLarge",
                  call1: "tuftedTitmouseCall1",
                  call2: "tuftedTitmouseCall2",
                  wikiLink: "https://en.wikipedia.org/wiki/Tufted_titmouse")]





