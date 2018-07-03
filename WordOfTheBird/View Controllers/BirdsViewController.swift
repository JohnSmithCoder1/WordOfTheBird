//
//  SongbirdViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 6/6/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class BirdTableViewCell: UITableViewCell {
    @IBOutlet var birdCellLabel: UILabel!
    @IBOutlet var birdCellImage: UIImageView!
}

class BirdsViewController: UITableViewController {
    
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birdArray.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        backgroundImage.frame = self.tableView.frame
        self.tableView.backgroundView = backgroundImage
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! BirdTableViewCell
        cell.birdCellLabel?.text = birdArray[indexPath.row].name
        cell.birdCellImage?.image = birdArray[indexPath.row].imageSmall
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "birdDetailSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? BirdDetailViewController {
                let myIndexPath = self.tableView.indexPathForSelectedRow!
                let row = myIndexPath.row
                destination.title = birdArray[row].name
                destination.imageDetail = birdArray[row].imageLarge
                destination.callDetail = birdArray[row].call
                destination.linkDetail = birdArray[row].link
            }
//        } else if segue.identifier == "americanKestrelSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = americanKestrel.name
//                destination.imageDetail = americanKestrel.imageLarge
//                destination.callDetail = americanKestrel.call
//                destination.linkDetail = americanKestrel.link
//            }
//        } else if segue.identifier == "baldEagleSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = baldEagle.name
//                destination.imageDetail = baldEagle.imageLarge
//                destination.callDetail = baldEagle.call
//                destination.linkDetail = baldEagle.link
//            }
//        } else if segue.identifier == "barredOwlSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = barredOwl.name
//                destination.imageDetail = barredOwl.imageLarge
//                destination.callDetail = barredOwl.call
//                destination.linkDetail = barredOwl.link
//            }
//        } else if segue.identifier == "blackCappedChickadeeSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = blackCappedChickadee.name
//                destination.imageDetail = blackCappedChickadee.imageLarge
//                destination.callDetail = blackCappedChickadee.call
//                destination.linkDetail = blackCappedChickadee.link
//            }
//        } else if segue.identifier == "blueJaySegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = blueJay.name
//                destination.imageDetail = blueJay.imageLarge
//                destination.callDetail = blueJay.call
//                destination.linkDetail = blueJay.link
//            }
//        } else if segue.identifier == "cardinalSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = cardinal.name
//                destination.imageDetail = cardinal.imageLarge
//                destination.callDetail = cardinal.call
//                destination.linkDetail = cardinal.link
//            }
//        } else if segue.identifier == "downyWoodpeckerSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = downyWoodpecker.name
//                destination.imageDetail = downyWoodpecker.imageLarge
//                destination.callDetail = downyWoodpecker.call
//                destination.linkDetail = downyWoodpecker.link
//            }
//        } else if segue.identifier == "greatHornedOwlSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = greatHornedOwl.name
//                destination.imageDetail = greatHornedOwl.imageLarge
//                destination.callDetail = greatHornedOwl.call
//                destination.linkDetail = greatHornedOwl.link
//            }
//        } else if segue.identifier == "hairyWoodpeckerSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = hairyWoodpecker.name
//                destination.imageDetail = hairyWoodpecker.imageLarge
//                destination.callDetail = hairyWoodpecker.call
//                destination.linkDetail = hairyWoodpecker.link
//            }
//        } else if segue.identifier == "houseFinchSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = houseFinch.name
//                destination.imageDetail = houseFinch.imageLarge
//                destination.callDetail = houseFinch.call
//                destination.linkDetail = houseFinch.link
//            }
//        } else if segue.identifier == "northernFlickerSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = northernFlicker.name
//                destination.imageDetail = northernFlicker.imageLarge
//                destination.callDetail = northernFlicker.call
//                destination.linkDetail = northernFlicker.link
//            }
//        } else if segue.identifier == "peregrineFalconSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = peregrineFalcon.name
//                destination.imageDetail = peregrineFalcon.imageLarge
//                destination.callDetail = peregrineFalcon.call
//                destination.linkDetail = peregrineFalcon.link
//            }
//        } else if segue.identifier == "pileatedWoodpeckerSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = pileatedWoodpecker.name
//                destination.imageDetail = pileatedWoodpecker.imageLarge
//                destination.callDetail = pileatedWoodpecker.call
//                destination.linkDetail = pileatedWoodpecker.link
//            }
//        } else if segue.identifier == "redBelliedWoodpeckerSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = redBelliedWoodpecker.name
//                destination.imageDetail = redBelliedWoodpecker.imageLarge
//                destination.callDetail = redBelliedWoodpecker.call
//                destination.linkDetail = redBelliedWoodpecker.link
//            }
//        } else if segue.identifier == "redHeadedWoodpeckerSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = redHeadedWoodpecker.name
//                destination.imageDetail = redHeadedWoodpecker.imageLarge
//                destination.callDetail = redHeadedWoodpecker.call
//                destination.linkDetail = redHeadedWoodpecker.link
//            }
//        } else if segue.identifier == "redTailedHawkSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = redTailedHawk.name
//                destination.imageDetail = redTailedHawk.imageLarge
//                destination.callDetail = redTailedHawk.call
//                destination.linkDetail = redTailedHawk.link
//            }
//        } else if segue.identifier == "tuftedTitmouseSegue" {
//            if let destination = segue.destination as? BirdDetailViewController {
//                destination.title = tuftedTitmouse.name
//                destination.imageDetail = tuftedTitmouse.imageLarge
//                destination.callDetail = tuftedTitmouse.call
//                destination.linkDetail = tuftedTitmouse.link
//            }
//     }
        }
}
