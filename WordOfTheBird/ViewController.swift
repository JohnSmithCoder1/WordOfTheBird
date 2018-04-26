//
//  ViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 4/25/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    @IBAction func bird0Tapped(_ sender: UIButton) {
        playGoldFinchCallSound()
    }
    
    @IBAction func bird1Tapped(_ sender: UIButton) {
        playBaldEagleCallSound()
    }
    
    @IBAction func bird2Tapped(_ sender: UIButton) {
        playBlueJayCallSound()
    }
    
    @IBAction func bird3Tapped(_ sender: UIButton) {
        playCardinalCallSound()
    }
    
    @IBAction func bird4Tapped(_ sender: UIButton) {
        playHouseFinchCallSound()
    }
    
    @IBAction func bird5Tapped(_ sender: UIButton) {
        playRedTailedHawkCallSound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playGoldFinchCallSound() {
        guard let url = Bundle.main.url(forResource: "goldFinchCall", withExtension: "wav") else {
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
    
    func playBaldEagleCallSound() {
        guard let url = Bundle.main.url(forResource: "baldEagleCall", withExtension: "wav") else {
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

    func playBlueJayCallSound() {
        guard let url = Bundle.main.url(forResource: "blueJayCall", withExtension: "wav") else {
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
    
    func playCardinalCallSound() {
        guard let url = Bundle.main.url(forResource: "cardinalCall", withExtension: "wav") else {
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
    
    func playHouseFinchCallSound() {
        guard let url = Bundle.main.url(forResource: "houseFinchCall", withExtension: "wav") else {
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
    
    func playRedTailedHawkCallSound() {
        guard let url = Bundle.main.url(forResource: "redTailedHawkCall", withExtension: "wav") else {
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

