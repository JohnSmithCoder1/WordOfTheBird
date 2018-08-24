//
//  AboutViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 8/23/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var aboutText: UITextView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        aboutText.setContentOffset(CGPoint.zero, animated: false)
    }
}
