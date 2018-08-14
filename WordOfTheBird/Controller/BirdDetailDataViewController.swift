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
    
    var callData1: String!
    var callData2: String!
    var linkData: String!
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(image: UIImage(named: "backgroundBottom.png"))
        backgroundImage.frame = self.tableView.frame
        tableView.backgroundView = backgroundImage
        tableView.isScrollEnabled = false
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
//        header.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                playSound(forObject: callData1)
            } else if indexPath.row == 1{
                playSound(forObject: callData2)
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                UIApplication.shared.open(URL(string: linkData)!)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func playSound(forObject: String) {
        guard let url = Bundle.main.url(forResource: forObject, withExtension: "wav") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let player = audioPlayer else { return }
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
}

