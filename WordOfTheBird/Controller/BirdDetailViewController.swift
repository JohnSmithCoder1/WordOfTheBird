//
//  BirdDetailViewController.swift
//  Segue
//
//  Created by Banana Viking on 6/13/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class BirdDetailViewController: UIViewController {
    var birdImage: UIImage?
    var calls = [String]()
    var infoLink: String?
    var mapLink: String?
    
    @IBOutlet weak var birdImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birdImageView.image = birdImage
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedSegue" {
            if let destinationTable = segue.destination as? BirdDetailDataViewController {
                destinationTable.calls = calls
                destinationTable.infoLink = infoLink
                destinationTable.mapLink = mapLink
            }
        }
    }
}
