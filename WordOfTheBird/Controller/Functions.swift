//
//  Functions.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 9/5/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}
