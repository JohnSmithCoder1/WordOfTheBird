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

class BirdsViewController: UITableViewController, UISearchResultsUpdating {
    
    var filteredBirds: [Bird]!
    var launchedBefore = false
    
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBirds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! BirdTableViewCell
        cell.birdCellLabel?.text = filteredBirds[indexPath.row].name
        cell.birdCellImage?.image = filteredBirds[indexPath.row].imageSmall
        cell.birdCellLabel?.adjustsFontSizeToFitWidth = true
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        backgroundImage.frame = self.tableView.frame
        self.tableView.backgroundView = backgroundImage
        filteredBirds = birdArray
        setupSearchController()
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barStyle = .black
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.returnKeyType = .done
        searchController.searchBar.enablesReturnKeyAutomatically = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredBirds = searchText.isEmpty ? birdArray : birdArray.filter { (item: Bird) -> Bool in
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredBirds = birdArray.filter { bird in
                return bird.name.lowercased().contains(searchText.lowercased())
            }
        } else {
            filteredBirds = birdArray
        }
        tableView.reloadData()
    }
}
