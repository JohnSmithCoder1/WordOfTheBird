//
//  SongbirdViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 6/6/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class BirdTableViewCell: UITableViewCell {
    @IBOutlet var birdName: UILabel!
    @IBOutlet var birdImageView: UIImageView!
}

class BirdsViewController: UITableViewController, UISearchResultsUpdating {
    
    var filteredBirds: [Bird]!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BirdDetailViewController {
            let myIndexPath = tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            destination.title = filteredBirds[row].name
            destination.birdImage = filteredBirds[row].imageLarge
            destination.call1 = filteredBirds[row].call1
            destination.call2 = filteredBirds[row].call2
            destination.wikiLink = filteredBirds[row].wikiLink
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBirds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! BirdTableViewCell
        cell.birdName?.text = filteredBirds[indexPath.row].name
        cell.birdImageView?.image = filteredBirds[indexPath.row].imageSmall
        cell.birdName?.adjustsFontSizeToFitWidth = true
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        backgroundImage.frame = tableView.frame
        tableView.backgroundView = backgroundImage
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
