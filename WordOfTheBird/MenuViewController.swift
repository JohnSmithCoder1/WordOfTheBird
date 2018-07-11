//
//  MenuViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 5/29/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        backgroundImage.frame = self.tableView.frame
        self.tableView.backgroundView = backgroundImage
    }

    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
