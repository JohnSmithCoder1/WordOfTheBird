//
//  ViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 5/29/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class WoodpeckerViewController: UITableViewController {
    
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "woodpecker", for: indexPath)
        
        let label = cell.viewWithTag(100) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Downy"
            cell.imageView?.image = UIImage(named: "downy")
        } else if indexPath.row == 1 {
            label.text = "Hairy"
            cell.imageView?.image = UIImage(named: "hairy")
        } else if indexPath.row == 2 {
            label.text = "Pileated"
            cell.imageView?.image = UIImage(named: "pileated")
        } else if indexPath.row == 3 {
            label.text = "Northern Flicker"
            cell.imageView?.image = UIImage(named: "northern flicker")
        } else if indexPath.row == 4 {
            label.text = "Red-bellied"
            cell.imageView?.image = UIImage(named: "red-bellied")
        } else if indexPath.row == 5 {
            label.text = "Red-headed"
            cell.imageView?.image = UIImage(named: "red-headed")
        }
        
        return cell
    }
}
