//
//  SongbirdViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 6/6/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class SongbirdViewController: UITableViewController {
    
    var player: AVAudioPlayer?
    
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func viewDidLoad() {
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        backgroundImage.frame = self.tableView.frame
        self.tableView.backgroundView = backgroundImage
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.row == 0 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/American_goldfinch")!)
        } else if indexPath.row == 1 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Black-capped_chickadee")!)
        } else if indexPath.row == 2 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Blue_jay")!)
        } else if indexPath.row == 3 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Cardinal_(bird)")!)
        } else if indexPath.row == 4 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/House_finch")!)
        } else if indexPath.row == 5 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Tufted_titmouse")!)
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
            playSound(forBird: "goldFinch")
        } else if indexPath.row == 1 {
            playSound(forBird: "chickadee")
        } else if indexPath.row == 2 {
            playSound(forBird: "blueJay")
        } else if indexPath.row == 3 {
            playSound(forBird: "cardinal")
        } else if indexPath.row == 4 {
            playSound(forBird: "houseFinch")
        } else if indexPath.row == 5 {
            playSound(forBird: "tuftedTitmouse")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
