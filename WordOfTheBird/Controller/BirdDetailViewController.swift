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
    var callDetailOne: String!
    var callDetailTwo: String!
    var linkDetail: String!
    
    override func viewDidLoad() { // these should go in viewWillAppear?
        super.viewDidLoad()
        birdImageLarge.image = imageDetail
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedSegue" {
            if let destinationTable = segue.destination as? BirdDetailDataViewController {
                destinationTable.callData1 = callDetailOne
                destinationTable.callData2 = callDetailTwo
                destinationTable.linkData = linkDetail
            }
        }
    }
}

