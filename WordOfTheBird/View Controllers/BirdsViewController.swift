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

class BirdsViewController: UITableViewController {
    
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birdArray.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        backgroundImage.frame = self.tableView.frame
        self.tableView.backgroundView = backgroundImage
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! BirdTableViewCell
        cell.birdCellLabel?.text = birdArray[indexPath.row].name
        cell.birdCellImage?.image = birdArray[indexPath.row].imageSmall
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? BirdDetailViewController {
                let myIndexPath = self.tableView.indexPathForSelectedRow!
                let row = myIndexPath.row
                destination.title = birdArray[row].name
                destination.imageDetail = birdArray[row].imageLarge
                destination.callDetail = birdArray[row].call
                destination.linkDetail = birdArray[row].link
            }
        }
    }
