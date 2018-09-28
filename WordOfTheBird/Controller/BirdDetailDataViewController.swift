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
    var calls = [String]()
    var infoLink: String?
    var mapLink: String?
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.backgroundView?.backgroundColor = UIColor(red: 79/255, green: 143/255, blue: 0/255, alpha: 0.5)
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        if section == 0 {
            header.textLabel?.text = "  Bird Calls"
        } else if section == 1 {
            header.textLabel?.text = "  Bird Data"
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        if section == 0 {
            rowCount = calls.count
        } else if section == 1 {
            rowCount = 2
        }
        return rowCount
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            playSound(forObject: calls[indexPath.row])
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: .UIApplicationDidEnterBackground, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        audioPlayer?.stop()
        if let destination = segue.destination as? WebViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            if indexPath.section == 1 && indexPath.row == 0 {
                destination.link = infoLink
            } else if indexPath.section == 1 && indexPath.row == 1 {
                destination.link = mapLink
            }
        }
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

