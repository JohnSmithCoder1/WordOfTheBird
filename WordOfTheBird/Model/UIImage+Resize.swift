//
//  UIImage+Resize.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 9/10/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

extension UIImage {
    func resized(withBounds bounds: CGSize) -> UIImage? {
        let horizontalRatio = bounds.width / size.width
        let verticalRatio = bounds.height / size.height
        let ratio = min(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
