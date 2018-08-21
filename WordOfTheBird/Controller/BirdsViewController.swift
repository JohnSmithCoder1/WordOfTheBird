//
//  SongbirdViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 6/6/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class BirdTableViewCell: UITableViewCell {
    @IBOutlet var birdNameLabel: UILabel!
    @IBOutlet var birdImageView: UIImageView!
}

class BirdsViewController: UITableViewController, UISearchResultsUpdating {
    
    let birdBank = BirdBank()
    var filteredBirds = [Bird]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBirds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BirdTableViewCell
        cell.birdNameLabel?.text = filteredBirds[indexPath.row].name
        cell.birdNameLabel?.adjustsFontSizeToFitWidth = true
        cell.birdImageView?.image = UIImage(named: filteredBirds[indexPath.row].imageSmall)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "background.png"))
        filteredBirds = birdBank.birds
        setupSearchController()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BirdDetailViewController,
            let row = tableView.indexPathForSelectedRow?.row {
            destination.title = filteredBirds[row].name
            destination.birdImage = UIImage(named: filteredBirds[row].imageLarge)
            destination.calls = filteredBirds[row].calls
            destination.wikiLink = filteredBirds[row].wikiLink
        }
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
        filteredBirds = searchText.isEmpty ? birdBank.birds : birdBank.birds.filter { (item: Bird) -> Bool in
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredBirds = birdBank.birds.filter { bird in
                return bird.name.lowercased().contains(searchText.lowercased())
            }
        } else {
            filteredBirds = birdBank.birds
        }
        tableView.reloadData()
    }
}
