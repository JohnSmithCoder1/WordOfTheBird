//
//  String+AddText.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 9/18/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import Foundation

extension String {
    mutating func add(text: String?, separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
