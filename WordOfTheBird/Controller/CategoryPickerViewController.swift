//
//  CategoryPickerViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 9/4/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class CategoryPickerViewController: UITableViewController {
    var selectedCategoryName = ""
    
    let categories = [
        "Other Birds",
        "American Goldfinch",
        "American Kestrel",
        "Bald Eagle",
        "Barred Owl",
        "Black-capped Chickadee",
        "Blue Jay",
        "Downy Woodpecker",
        "Great Horned Owl",
        "Hairy Woodpecker",
        "House Finch",
        "Northern Cardinal",
        "Northern Flicker",
        "Peregrine Falcon",
        "Pileated Woodpecker",
        "Red-bellied Woodpecker",
        "Red-headed Woodpecker",
        "Red-tailed Hawk",
        "Tufted Titmouse",
        ]
    
    var selectedIndexPath = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "background.png"))
        
        for i in 0..<categories.count {
            if categories[i] == selectedCategoryName {
                selectedIndexPath = IndexPath(row: i, section: 0)
                break
            }
        }
    }
    
//    MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let categoryName = categories[indexPath.row]
        cell.textLabel!.text = categoryName
        
        if categoryName == selectedCategoryName {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != selectedIndexPath.row {
            if let newCell = tableView.cellForRow(at: indexPath) {
                newCell.accessoryType = .checkmark
            }
            if let oldCell = tableView.cellForRow(at: selectedIndexPath) {
                oldCell.accessoryType = .none
            }
            selectedIndexPath = indexPath
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickedCategory" {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                selectedCategoryName = categories[indexPath.row]
            }
        }
    }
}
