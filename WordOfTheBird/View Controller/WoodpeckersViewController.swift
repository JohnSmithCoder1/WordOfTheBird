//
//  WoodPeckersViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 5/3/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class WoodpeckersViewController: UIViewController {
    var player: AVAudioPlayer?
    
    @IBAction func bird200Tapped(_ sender: UIButton) {
        playSound(forBird: "downy")
    }
    
    @IBAction func bird201Tapped(_ sender: UIButton) {
        playSound(forBird: "hairy")
    }
    
    @IBAction func bird202Tapped(_ sender: UIButton) {
        playSound(forBird: "pileated")
    }
    
    @IBAction func bird203Tapped(_ sender: UIButton) {
        playSound(forBird: "northernFlicker")
    }
    
    @IBAction func bird204Tapped(_ sender: UIButton) {
        playSound(forBird: "redBellied")
    }
    
    @IBAction func bird205Tapped(_ sender: UIButton) {
        playSound(forBird: "redHeaded")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: .UIApplicationDidEnterBackground, object: nil)
    }
    
    @objc func appDidEnterBackground() {
        player?.stop()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
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
