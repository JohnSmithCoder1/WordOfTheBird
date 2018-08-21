//
//  BirdDetailDataViewController.swift
//  Segue
//
//  Created by Banana Viking on 6/13/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class BirdDetailDataViewController: UITableViewController {
    
    var audioPlayer: AVAudioPlayer?
    var calls: [String]?
    var rows = 0
    var wikiLink: String?
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if let calls = calls {
                rows = calls.count
            }
        } else if section == 1 {
            rows = 1
        }
        return rows
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            for row in 0..<tableView.numberOfRows(inSection: 0) {
                if let calls = calls {
                    playSound(forObject: calls[row])
                }
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                audioPlayer?.stop()
                if let wikiLink = wikiLink {
                    UIApplication.shared.open(URL(string: wikiLink)!)
                }
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundBottom.png"))
//        tableView.isScrollEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: .UIApplicationDidEnterBackground, object: nil)
    }
    
    func playSound(forObject: String) {
        guard let url = Bundle.main.url(forResource: forObject, withExtension: "wav") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    
    @objc func didEnterBackground() {
        audioPlayer?.stop()
    }
}

