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
    
    var call1: String?
    var call2: String?
    var wikiLink: String?
    var audioPlayer: AVAudioPlayer?
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                if let call1 = call1 {
                    playSound(forObject: call1)
                }
            } else if indexPath.row == 1 {
                if let call2 = call2 {
                    playSound(forObject: call2)
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
        tableView.isScrollEnabled = false
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
}

