//
//  BirdDetailViewController.swift
//  Segue
//
//  Created by Banana Viking on 6/13/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class BirdDetailViewController: UIViewController {
    @IBOutlet weak var birdImageView: UIImageView!
    
    var birdImage: UIImage!
    var call1: String!
    var call2: String!
    var wikiLink: String!
    
    override func viewDidLoad() { // these should go in viewWillAppear?
        super.viewDidLoad()
        birdImageView.image = birdImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedSegue" {
            if let destinationTable = segue.destination as? BirdDetailDataViewController {
                destinationTable.call1 = call1
                destinationTable.call2 = call2
                destinationTable.wikiLink = wikiLink
            }
        }
    }
}

