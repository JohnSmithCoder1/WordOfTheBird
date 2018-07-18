//
//  MenuViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 5/29/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    var launchedBefore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        backgroundImage.frame = self.tableView.frame
        self.tableView.backgroundView = backgroundImage
        print("pissed on")
        setupFirstLaunch()
        print("pissed off")
    }

    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setupFirstLaunch() {
        launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        print("launched before: \(launchedBefore)")
        if launchedBefore == false {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let firstLaunchViewController = storyBoard.instantiateViewController(withIdentifier: "firstLaunchViewController")
            firstLaunchViewController.modalTransitionStyle = .crossDissolve
            self.present(firstLaunchViewController, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
    }
}

