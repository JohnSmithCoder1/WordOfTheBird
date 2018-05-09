//
//  BirdsOfPreyViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 5/3/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class BirdsOfPreyViewController: UIViewController {
    var player: AVAudioPlayer?
    
    @IBAction func birdLinkTapped(_ sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 300:
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/American_kestrel")!)
        case 301:
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Bald_eagle")!)
        case 302:
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Great_horned_owl")!)
        case 303:
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Peregrine_falcon")!)
        case 304:
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Barred_owl")!)
        case 305:
            UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Red-tailed_hawk")!)
        default:
            print("BIRD K-KAWWWWW")
            return
        }
    }
    
    @IBAction func bird300Tapped(_ sender: UIButton) {
        playSound(forBird: "americanKestrel")
    }
    
    @IBAction func bird301Tapped(_ sender: UIButton) {
        playSound(forBird: "baldEagle")
    }
    
    @IBAction func bird302Tapped(_ sender: UIButton) {
        playSound(forBird: "greatHornedOwl")
    }
    
    @IBAction func bird303Tapped(_ sender: UIButton) {
        playSound(forBird: "peregrineFalcon")
    }
    
    @IBAction func bird304Tapped(_ sender: UIButton) {
        playSound(forBird: "barredOwl")
    }
    
    @IBAction func bird305Tapped(_ sender: UIButton) {
        playSound(forBird: "redTailedHawk")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: .UIApplicationDidEnterBackground, object: nil)
    }
    
    @objc func appDidEnterBackground() {
        player?.stop()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.stop()
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
