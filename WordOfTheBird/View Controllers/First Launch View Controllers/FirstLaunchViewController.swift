//
//  FirstLaunchVC.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 7/18/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class FirstLaunchViewController: UIViewController {
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
