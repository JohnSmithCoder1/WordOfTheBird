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
    
    @IBAction func bird100Tapped(_ sender: UIButton) {
        playSound(forBird: "goldFinch")
    }
    
    @IBAction func bird101Tapped(_ sender: UIButton) {
        playSound(forBird: "tuftedTitmouse")
    }
    
    @IBAction func bird102Tapped(_ sender: UIButton) {
        playSound(forBird: "blueJay")
    }
    
    @IBAction func bird103Tapped(_ sender: UIButton) {
        playSound(forBird: "cardinal")
    }
    
    @IBAction func bird104Tapped(_ sender: UIButton) {
        playSound(forBird: "houseFinch")
    }
    
    @IBAction func bird105Tapped(_ sender: UIButton) {
        playSound(forBird: "chickadee")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: .UIApplicationDidEnterBackground, object: nil)
    }
    
    @objc func appDidEnterBackground() {
        player!.stop()
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

