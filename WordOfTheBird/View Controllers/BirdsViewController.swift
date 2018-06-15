//
//  SongbirdViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 6/6/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class BirdsViewController: UITableViewController {
    
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        backgroundImage.frame = self.tableView.frame
        self.tableView.backgroundView = backgroundImage
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "americanGoldfinchSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = americanGoldfinch.name
                destination.imageDetail = americanGoldfinch.imageLarge
                destination.callDetail = americanGoldfinch.call
                destination.linkDetail = americanGoldfinch.link
            }
        }
        
//        if segue.identifier == "cardinal" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = cardinal.name
//                destination.detailImage = cardinal.imageLarge
//                destination.call = cardinal.call
//                destination.link = cardinal.link
//            }
//        }
    }
    
    let americanGoldfinch = Bird(name: "American Goldfinch",
                                 imageSmall: UIImage(named: "americanGoldfinchImageSmall")!,
                                 imageLarge: UIImage(named: "americanGoldfinchImageSmall")!,
                                 call: "americanGoldfinchCall0",
                                 link: "https://en.wikipedia.org/wiki/American_goldfinch")
    
    let americanKestrel = Bird(name: "American Kestrel",
                               imageSmall: UIImage(named: "americanKestrelImageSmall")!,
                               imageLarge: UIImage(named: "americanKestrelImageSmall")!,
                               call: "americanKestrelCall0",
                               link: "https://en.wikipedia.org/wiki/American_kestrel")
    
    let baldEagle = Bird(name: "Bald Eagle",
                         imageSmall: UIImage(named: "baldEagleImageSmall")!,
                         imageLarge: UIImage(named: "baldEagleImageSmall")!,
                         call: "baldEagleCall0",
                         link: "https://en.wikipedia.org/wiki/Bald_eagle")
    
    let barredOwl = Bird(name: "Barred Owl",
                         imageSmall: UIImage(named: "barredOwlImageSmall")!,
                         imageLarge: UIImage(named: "barredOwlImageSmall")!,
                         call: "barredOwlCall0",
                         link: "https://en.wikipedia.org/wiki/Barred_owl")
    
    let blackCappedChickadee = Bird(name: "Black-capped Chickadee",
                                    imageSmall: UIImage(named: "blackCappedChickadeeImageSmall")!,
                                    imageLarge: UIImage(named: "blackCappedChickadeeImageSmall")!,
                                    call: "blackCappedChickadeeCall0",
                                    link: "https://en.wikipedia.org/wiki/Black-capped_chickadee")
    
    let blueJay = Bird(name: "Blue Jay",
                       imageSmall: UIImage(named: "blueJayImageSmall")!,
                       imageLarge: UIImage(named: "blueJayImageSmall")!,
                       call: "blueJayCall0",
                       link: "https://en.wikipedia.org/wiki/Blue_jay")
    
    let cardinal = Bird(name: "Cardinal",
                        imageSmall: UIImage(named: "cardinalImageSmall")!,
                        imageLarge: UIImage(named: "cardinalImageSmall")!,
                        call: "cardinalCall0",
                        link: "https://en.wikipedia.org/wiki/Cardinal_(bird)")
    
    let downyWoodpecker = Bird(name: "Downy Woodpecker",
                               imageSmall: UIImage(named: "downyWoodpeckerImageSmall")!,
                               imageLarge: UIImage(named: "downyWoodpeckerImageSmall")!,
                               call: "downyWoodpeckerCall0",
                               link: "https://en.wikipedia.org/wiki/Downy_woodpecker")
    
    let greatHornedOwl = Bird(name: "Great Horned Owl",
                              imageSmall: UIImage(named: "greatHornedOwlImageSmall")!,
                              imageLarge: UIImage(named: "greatHornedOwlImageSmall")!,
                              call: "greatHornedOwlCall0",
                              link: "https://en.wikipedia.org/wiki/Great_horned_owl")
    
    let hairyWoodpecker = Bird(name: "Hairy Woodpecker",
                               imageSmall: UIImage(named: "hairyWoodpeckerImageSmall")!,
                               imageLarge: UIImage(named: "hairyWoodpeckerImageSmall")!,
                               call: "hairyWoodpeckerCall0",
                               link: "https://en.wikipedia.org/wiki/Hairy_woodpecker")
    
    let houseFinch = Bird(name: "House Finch",
                          imageSmall: UIImage(named: "houseFinchImageSmall")!,
                          imageLarge: UIImage(named: "houseFinchImageSmall")!,
                          call: "houseFinchCall0",
                          link: "https://en.wikipedia.org/wiki/House_finch")
    
    let northernFlicker = Bird(name: "Northern Flicker",
                               imageSmall: UIImage(named: "northernFlickerImageSmall")!,
                               imageLarge: UIImage(named: "northernFlickerImageSmall")!,
                               call: "northernFlickerCall0",
                               link: "https://en.wikipedia.org/wiki/Northern_flicker")
    
    let peregrineFalcon = Bird(name: "Peregrine Falcon",
                               imageSmall: UIImage(named: "peregrineFalconImageSmall")!,
                               imageLarge: UIImage(named: "peregrineFalconImageSmall")!,
                               call: "peregrineFalconCall0",
                               link: "https://en.wikipedia.org/wiki/Peregrine_falcon")
    
    let pileatedWoodpecker = Bird(name: "Pileated Woodpecker",
                                  imageSmall: UIImage(named: "pileatedWoodpeckerImageSmall")!,
                                  imageLarge: UIImage(named: "pileatedWoodpeckerImageSmall")!,
                                  call: "pileatedWoodpeckerCall0",
                                  link: "https://en.wikipedia.org/wiki/Pileated_woodpecker")
    
    let redBelliedWoodpecker = Bird(name: "Red-bellied Woodpecker",
                                    imageSmall: UIImage(named: "redBelliedWoodpeckerImageSmall")!,
                                    imageLarge: UIImage(named: "redBelliedWoodpeckerImageSmall")!,
                                    call: "redBelliedWoodpeckerCall0",
                                    link: "https://en.wikipedia.org/wiki/Red-bellied_woodpecker")
    
    let redHeadedWoodpecker = Bird(name: "Red-headed Woodpecker",
                                   imageSmall: UIImage(named: "redHeadedWoodpeckerImageSmall")!,
                                   imageLarge: UIImage(named: "redHeadedWoodpeckerImageSmall")!,
                                   call: "redHeadedWoodpeckerCall0",
                                   link: "https://en.wikipedia.org/wiki/Red-headed_woodpecker")
    
    let redTailedHawk = Bird(name: "Red-tailed Hawk",
                             imageSmall: UIImage(named: "redTailedHawkImageSmall")!,
                             imageLarge: UIImage(named: "redTailedHawkImageSmall")!,
                             call: "redTailedHawkCall0",
                             link: "https://en.wikipedia.org/wiki/Red-tailed_hawk")
    
    let tuftedTitmouse = Bird(name: "Tufted Titmouse",
                              imageSmall: UIImage(named: "tuftedTitmouseImageSmall")!,
                              imageLarge: UIImage(named: "tuftedTitmouseImageSmall")!,
                              call: "tuftedTitmouseCall0",
                              link: "https://en.wikipedia.org/wiki/Tufted_titmouse")

}
