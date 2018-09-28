//
//  BirdBank.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 8/16/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class BirdBank {
    let birds = [
        Bird(name: "American Goldfinch",
             imageSmall: "americanGoldfinchImageSmall",
             imageLarge: "americanGoldfinchImageLarge",
             calls: ["americanGoldfinchCall1", "americanGoldfinchCall2"],
             infoLink: "https://en.wikipedia.org/wiki/American_goldfinch",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/7/72/American_Goldfinch-rangemap.png"),
        
        Bird(name: "American Kestrel",
             imageSmall: "americanKestrelImageSmall",
             imageLarge: "americanKestrelImageLarge",
             calls: ["americanKestrelCall1", "americanKestrelCall2"],
             infoLink: "https://en.wikipedia.org/wiki/American_kestrel",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Falco_sparverius_range_map.svg/746px-Falco_sparverius_range_map.svg.png"),
        
        Bird(name: "Bald Eagle",
             imageSmall: "baldEagleImageSmall",
             imageLarge: "baldEagleImageLarge",
             calls: ["baldEagleCall1", "baldEagleCall2", "baldEagleCall3"],
             infoLink: "https://en.wikipedia.org/wiki/Bald_eagle",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/5/57/Distribution_H._leucocephalus.png"),
        
        Bird(name: "Barred Owl",
             imageSmall: "barredOwlImageSmall",
             imageLarge: "barredOwlImageLarge",
             calls: ["barredOwlCall1"],
             infoLink: "https://en.wikipedia.org/wiki/Barred_owl",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Strix_varia_map.svg/880px-Strix_varia_map.svg.png"),
        
        Bird(name: "Black-capped Chickadee",
             imageSmall: "blackCappedChickadeeImageSmall",
             imageLarge: "blackCappedChickadeeImageLarge",
             calls: ["blackCappedChickadeeCall1", "blackCappedChickadeeCall2"],
             infoLink: "https://en.wikipedia.org/wiki/Black-capped_chickadee",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/0/00/Poecile_atricapillus_distribution_map.png"),
        
        Bird(name: "Blue Jay",
             imageSmall: "blueJayImageSmall",
             imageLarge: "blueJayImageLarge",
             calls: ["blueJayCall1", "blueJayCall2"],
             infoLink: "https://en.wikipedia.org/wiki/Blue_jay",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/a/ad/Blue_Jay-rangemap.png"),
        
        Bird(name: "Downy Woodpecker",
             imageSmall: "downyWoodpeckerImageSmall",
             imageLarge: "downyWoodpeckerImageLarge",
             calls: ["downyWoodpeckerCall1"],
             infoLink: "https://en.wikipedia.org/wiki/Downy_woodpecker",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/4/46/Downy_Woodpecker-rangemap.png"),
        
        Bird(name: "Great Horned Owl",
             imageSmall: "greatHornedOwlImageSmall",
             imageLarge: "greatHornedOwlImageLarge",
             calls: ["greatHornedOwlCall1"],
             infoLink: "https://en.wikipedia.org/wiki/Great_horned_owl",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Bubo_virginianus_dis.png/411px-Bubo_virginianus_dis.png"),
        
        Bird(name: "Hairy Woodpecker",
             imageSmall: "hairyWoodpeckerImageSmall",
             imageLarge: "hairyWoodpeckerImageLarge",
             calls: ["hairyWoodpeckerCall1"],
             infoLink: "https://en.wikipedia.org/wiki/Hairy_woodpecker",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Picoides_villosus_map.svg/880px-Picoides_villosus_map.svg.png"),
        
        Bird(name: "House Finch",
             imageSmall: "houseFinchImageSmall",
             imageLarge: "houseFinchImageLarge",
             calls: ["houseFinchCall1", "houseFinchCall2", "houseFinchCall3"],
             infoLink: "https://en.wikipedia.org/wiki/House_finch",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Carpodacus_mexicanus_map.svg/880px-Carpodacus_mexicanus_map.svg.png"),
        
        Bird(name: "Northern Cardinal",
             imageSmall: "cardinalImageSmall",
             imageLarge: "cardinalImageLarge",
             calls: ["northernCardinalCall1", "northernCardinalCall2"],
             infoLink: "https://en.wikipedia.org/wiki/Northern_cardinal",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/3/33/Northern_Cardinal-rangemap.gif"),
        
        Bird(name: "Northern Flicker",
             imageSmall: "northernFlickerImageSmall",
             imageLarge: "northernFlickerImageLarge",
             calls: ["northernFlickerCall1", "northernFlickerCall2"],
             infoLink: "https://en.wikipedia.org/wiki/Northern_flicker",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/2/28/Northern_Flicker-rangemap.gif"),
        
        Bird(name: "Peregrine Falcon",
             imageSmall: "peregrineFalconImageSmall",
             imageLarge: "peregrineFalconImageLarge",
             calls: ["peregrineFalconCall1", "peregrineFalconCall2"],
             infoLink: "https://en.wikipedia.org/wiki/Peregrine_falcon",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/PeregrineRangeMap.png/800px-PeregrineRangeMap.png"),
        
        Bird(name: "Pileated Woodpecker",
             imageSmall: "pileatedWoodpeckerImageSmall",
             imageLarge: "pileatedWoodpeckerImageLarge",
             calls: ["pileatedWoodpeckerCall1"],
             infoLink: "https://en.wikipedia.org/wiki/Pileated_woodpecker",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/8/8d/Pileated_Woodpecker-rangemap.gif"),
        
        Bird(name: "Red-bellied Woodpecker",
             imageSmall: "redBelliedWoodpeckerImageSmall",
             imageLarge: "redBelliedWoodpeckerImageLarge",
             calls: ["redBelliedWoodpeckerCall1"],
             infoLink: "https://en.wikipedia.org/wiki/Red-bellied_woodpecker",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/5/55/Red-bellied_Woodpecker-rangemap.gif"),
        
        Bird(name: "Red-headed Woodpecker",
             imageSmall: "redHeadedWoodpeckerImageSmall",
             imageLarge: "redHeadedWoodpeckerImageLarge",
             calls: ["redHeadedWoodpeckerCall1"],
             infoLink: "https://en.wikipedia.org/wiki/Red-headed_woodpecker",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/8/8d/Melanerpes_erythrocephalus_distr.png"),
        
        Bird(name: "Red-tailed Hawk",
             imageSmall: "redTailedHawkImageSmall",
             imageLarge: "redTailedHawkImageLarge",
             calls: ["redTailedHawkCall1"],
             infoLink: "https://en.wikipedia.org/wiki/Red-tailed_hawk",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Buteo_jamaicensis_map.svg/880px-Buteo_jamaicensis_map.svg.png"),
        
        Bird(name: "Tufted Titmouse",
             imageSmall: "tuftedTitmouseImageSmall",
             imageLarge: "tuftedTitmouseImageLarge",
             calls: ["tuftedTitmouseCall1"],
             infoLink: "https://en.wikipedia.org/wiki/Tufted_titmouse",
             mapLink: "https://upload.wikimedia.org/wikipedia/commons/3/39/Tufted_Titmouse-rangemap.gif")
    ]
}
