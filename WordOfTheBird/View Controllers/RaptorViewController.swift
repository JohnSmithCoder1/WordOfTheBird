//
//  RaptorViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 6/6/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class RaptorViewController: UITableViewController {
    
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
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/American_kestrel")!)
        } else if indexPath.row == 1 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Bald_eagle")!)
        } else if indexPath.row == 2 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Barred_owl")!)
        } else if indexPath.row == 3 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Great_horned_owl")!)
        } else if indexPath.row == 4 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Peregrine_falcon")!)
        } else if indexPath.row == 5 {
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Red-tailed_hawk")!)
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
            playSound(forBird: "americanKestrel")
        } else if indexPath.row == 1 {
            playSound(forBird: "baldEagle")
        } else if indexPath.row == 2 {
            playSound(forBird: "barredOwl")
        } else if indexPath.row == 3 {
            playSound(forBird: "greatHornedOwl")
        } else if indexPath.row == 4 {
            playSound(forBird: "peregrineFalcon")
        } else if indexPath.row == 5 {
            playSound(forBird: "redTailedHawk")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
