//
//  ViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 4/25/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class SongBirdsViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    @IBAction func bird0Tapped(_ sender: UIButton) {
        playSound(forBird: "goldFinch")
    }
    
    @IBAction func bird1Tapped(_ sender: UIButton) {
        playSound(forBird: "baldEagle")
    }
    
    @IBAction func bird2Tapped(_ sender: UIButton) {
        playSound(forBird: "blueJay")
    }
    
    @IBAction func bird3Tapped(_ sender: UIButton) {
        playSound(forBird: "cardinal")
    }
    
    @IBAction func bird4Tapped(_ sender: UIButton) {
        playSound(forBird: "houseFinch")
    }
    
    @IBAction func bird5Tapped(_ sender: UIButton) {
        playSound(forBird: "redTailedHawk")
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

}

