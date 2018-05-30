//
//  ViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 5/29/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class WoodpeckerViewController: UITableViewController {
    
    var player: AVAudioPlayer?

//    @IBAction func birdLinkTapped(_ sender: AnyObject) {
//        guard let button = sender as? UIButton else {
//            return
//        }
//
//        switch button.tag {
//        case indexPath.row == 0:
//            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Downy_woodpecker")!)
////        case 201:
////            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Hairy_woodpecker")!)
////        case 202:
////            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Pileated_woodpecker")!)
////        case 203:
////            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Northern_flicker")!)
////        case 204:
////            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Red-bellied_woodpecker")!)
////        case 205:
////            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Red-headed_woodpecker")!)
//        default:
//            print("BIRD K-KAWWWWW")
//            return
//        }
//    }
    
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "woodpecker", for: indexPath)
        
        let label = cell.viewWithTag(100) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Downy"
            cell.imageView?.image = UIImage(named: "downy")
        } else if indexPath.row == 1 {
            label.text = "Hairy"
            cell.imageView?.image = UIImage(named: "hairy")
        } else if indexPath.row == 2 {
            label.text = "Pileated"
            cell.imageView?.image = UIImage(named: "pileated")
        } else if indexPath.row == 3 {
            label.text = "Northern Flicker"
            cell.imageView?.image = UIImage(named: "northern flicker")
        } else if indexPath.row == 4 {
            label.text = "Red-bellied"
            cell.imageView?.image = UIImage(named: "red-bellied")
        } else if indexPath.row == 5 {
            label.text = "Red-headed"
            cell.imageView?.image = UIImage(named: "red-headed")
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.row == 0 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Downy_woodpecker")!)
        } else if indexPath.row == 1 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Hairy_woodpecker")!)
        } else if indexPath.row == 2 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Pileated_woodpecker")!)
        } else if indexPath.row == 3 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Northern_flicker")!)
        } else if indexPath.row == 4 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Red-bellied_woodpecker")!)
        } else if indexPath.row == 5 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Red-headed_woodpecker")!)
        }
    }
    
    func playSound(forBird: String) {
        guard let url = Bundle.main.url(forResource: forBird, withExtension: "wav") else {
            print("url not found")
            return
        }
        
        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    
    //without this, the cell stays selected after clicking
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            playSound(forBird: "downy")
        } else if indexPath.row == 1 {
            playSound(forBird: "hairy")
        } else if indexPath.row == 2 {
            playSound(forBird: "pileated")
        } else if indexPath.row == 3 {
            playSound(forBird: "northernFlicker")
        } else if indexPath.row == 4 {
            playSound(forBird: "redBellied")
        } else if indexPath.row == 5 {
            playSound(forBird: "redHeaded")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
