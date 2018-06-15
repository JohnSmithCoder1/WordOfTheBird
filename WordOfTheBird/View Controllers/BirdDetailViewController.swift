//
//  BirdDetailViewController.swift
//  Segue
//
//  Created by Banana Viking on 6/13/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class BirdDetailViewController: UIViewController {
    @IBOutlet weak var birdImageLarge: UIImageView!
    
    var imageDetail: UIImage!
    var callDetail: String!
    var linkDetail: String!
    
    override func viewDidLoad() { // these should go in viewWillAppear?
        super.viewDidLoad()
        birdImageLarge.layer.cornerRadius = 10
        birdImageLarge.image = imageDetail
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedSegue" {
            if let destinationTable = segue.destination as? BirdDetailDataViewController {
                destinationTable.callData = callDetail
                destinationTable.linkData = linkDetail
            }
        }
    }
}

