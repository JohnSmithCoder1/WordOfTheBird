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
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
            backgroundImage.frame = self.tableView.frame
            self.tableView.backgroundView = backgroundImage
    }

    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
  
/*
 
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "birdType", for: indexPath)
        
        let label = cell.viewWithTag(10) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Woodpeckers"
        } else if indexPath.row == 1 {
            label.text = "Songbirds"
        } else if indexPath.row == 2 {
            label.text = "Birds of Prey"
        }
        
        return cell
    }
}

*/
