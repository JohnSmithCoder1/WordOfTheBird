//
//  MenuViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 5/29/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    override func viewDidLoad() {
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
            backgroundImage.frame = self.tableView.frame
            self.tableView.backgroundView = backgroundImage
    }

    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
}

// adds the following settings in IB for all views under attributes inspector
extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

/*
 
    // for UITableView data source protocol
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "birdType", for: indexPath)
        
        let label = cell.viewWithTag(10) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Woodpeckers"
        } else if indexPath.row == 1 {
            label.text = "Songbirds"
        } else if indexPath.row == 2 {
            label.text = "Birds of Prey"
        }
        
        return cell
    }
}

*/
