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
    
    var birdImage: UIImage?
    var calls = [String]()
    var infoLink: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birdImageView.image = birdImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedSegue" {
            if let destinationTable = segue.destination as? BirdDetailDataViewController {
                destinationTable.calls = calls
                destinationTable.infoLink = infoLink
            }
        }
    }
}

