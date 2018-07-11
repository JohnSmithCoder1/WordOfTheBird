//
//  SongbirdViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 6/6/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class BirdTableViewCell: UITableViewCell {
    @IBOutlet var birdCellLabel: UILabel!
    @IBOutlet var birdCellImage: UIImageView!
}

class BirdsViewController: UITableViewController,  UISearchBarDelegate {
    
    var filteredBirds: [Bird]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBirds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! BirdTableViewCell
        cell.birdCellLabel?.text = filteredBirds[indexPath.row].name
        cell.birdCellImage?.image = filteredBirds[indexPath.row].imageSmall
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        backgroundImage.frame = self.tableView.frame
        self.tableView.backgroundView = backgroundImage
        filteredBirds = birdArray
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When user has entered text into the search box use the filter method to iterate over all items in the data array for each item, return true if the item should be included and false if the item should NOT be included
        filteredBirds = searchText.isEmpty ? birdArray : birdArray.filter { (item: Bird) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? BirdDetailViewController {
                let myIndexPath = self.tableView.indexPathForSelectedRow!
                let row = myIndexPath.row
                destination.title = filteredBirds[row].name
                destination.imageDetail = filteredBirds[row].imageLarge
                destination.callDetail = filteredBirds[row].call
                destination.linkDetail = filteredBirds[row].link
            }
        }
    }
