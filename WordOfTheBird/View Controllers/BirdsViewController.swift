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
        } else if segue.identifier == "americanKestrelSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = americanKestrel.name
                destination.imageDetail = americanKestrel.imageLarge
                destination.callDetail = americanKestrel.call
                destination.linkDetail = americanKestrel.link
            }
        } else if segue.identifier == "baldEagleSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = baldEagle.name
                destination.imageDetail = baldEagle.imageLarge
                destination.callDetail = baldEagle.call
                destination.linkDetail = baldEagle.link
            }
        } else if segue.identifier == "barredOwlSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = barredOwl.name
                destination.imageDetail = barredOwl.imageLarge
                destination.callDetail = barredOwl.call
                destination.linkDetail = barredOwl.link
            }
        } else if segue.identifier == "blackCappedChickadeeSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = blackCappedChickadee.name
                destination.imageDetail = blackCappedChickadee.imageLarge
                destination.callDetail = blackCappedChickadee.call
                destination.linkDetail = blackCappedChickadee.link
            }
        } else if segue.identifier == "blueJaySegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = blueJay.name
                destination.imageDetail = blueJay.imageLarge
                destination.callDetail = blueJay.call
                destination.linkDetail = blueJay.link
            }
        } else if segue.identifier == "cardinalSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = cardinal.name
                destination.imageDetail = cardinal.imageLarge
                destination.callDetail = cardinal.call
                destination.linkDetail = cardinal.link
            }
        } else if segue.identifier == "downyWoodpeckerSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = downyWoodpecker.name
                destination.imageDetail = downyWoodpecker.imageLarge
                destination.callDetail = downyWoodpecker.call
                destination.linkDetail = downyWoodpecker.link
            }
        } else if segue.identifier == "greatHornedOwlSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = greatHornedOwl.name
                destination.imageDetail = greatHornedOwl.imageLarge
                destination.callDetail = greatHornedOwl.call
                destination.linkDetail = greatHornedOwl.link
            }
        } else if segue.identifier == "hairyWoodpeckerSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = hairyWoodpecker.name
                destination.imageDetail = hairyWoodpecker.imageLarge
                destination.callDetail = hairyWoodpecker.call
                destination.linkDetail = hairyWoodpecker.link
            }
        } else if segue.identifier == "houseFinchSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = houseFinch.name
                destination.imageDetail = houseFinch.imageLarge
                destination.callDetail = houseFinch.call
                destination.linkDetail = houseFinch.link
            }
        } else if segue.identifier == "northernFlickerSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = northernFlicker.name
                destination.imageDetail = northernFlicker.imageLarge
                destination.callDetail = northernFlicker.call
                destination.linkDetail = northernFlicker.link
            }
        } else if segue.identifier == "peregrineFalconSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = peregrineFalcon.name
                destination.imageDetail = peregrineFalcon.imageLarge
                destination.callDetail = peregrineFalcon.call
                destination.linkDetail = peregrineFalcon.link
            }
        } else if segue.identifier == "pileatedWoodpeckerSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = pileatedWoodpecker.name
                destination.imageDetail = pileatedWoodpecker.imageLarge
                destination.callDetail = pileatedWoodpecker.call
                destination.linkDetail = pileatedWoodpecker.link
            }
        } else if segue.identifier == "redBelliedWoodpeckerSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = redBelliedWoodpecker.name
                destination.imageDetail = redBelliedWoodpecker.imageLarge
                destination.callDetail = redBelliedWoodpecker.call
                destination.linkDetail = redBelliedWoodpecker.link
            }
        } else if segue.identifier == "redHeadedWoodpeckerSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = redHeadedWoodpecker.name
                destination.imageDetail = redHeadedWoodpecker.imageLarge
                destination.callDetail = redHeadedWoodpecker.call
                destination.linkDetail = redHeadedWoodpecker.link
            }
        } else if segue.identifier == "redTailedHawkSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = redTailedHawk.name
                destination.imageDetail = redTailedHawk.imageLarge
                destination.callDetail = redTailedHawk.call
                destination.linkDetail = redTailedHawk.link
            }
        } else if segue.identifier == "tuftedTitmouseSegue" {
            if let destination = segue.destination as? BirdDetailViewController {
                destination.title = tuftedTitmouse.name
                destination.imageDetail = tuftedTitmouse.imageLarge
                destination.callDetail = tuftedTitmouse.call
                destination.linkDetail = tuftedTitmouse.link
            }
        }
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
