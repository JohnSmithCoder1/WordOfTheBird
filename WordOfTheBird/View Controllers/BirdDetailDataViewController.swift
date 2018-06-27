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
    
    var callData: String!
    var linkData: String!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        let backgroundImage = UIImageView(image: UIImage(named: "backgroundBottom.png"))
        backgroundImage.frame = self.tableView.frame
        self.tableView.backgroundView = backgroundImage
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                playSound(forCall: callData)
            } else if indexPath.row == 1 {
                playSound(forCall: callData)
            } else if indexPath.row == 2 {
                playSound(forCall: callData)
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                UIApplication.shared.open(URL(string: linkData)!)
            } else if indexPath.row == 1 {
                print("map button pressed")
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func playSound(forCall: String) {
        guard let url = Bundle.main.url(forResource: forCall, withExtension: "wav") else {
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
