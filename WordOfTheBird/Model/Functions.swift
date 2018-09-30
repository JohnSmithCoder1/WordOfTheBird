//
//  Functions.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 9/5/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

let CoreDataSaveFailedNotification = Notification.Name(rawValue: "CoreDataSaveFailedNotification")

let applicationDocumentsDirectory: URL = {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}()

func fatalCoreDataError(_ error: Error) {
    NotificationCenter.default.post(name: CoreDataSaveFailedNotification, object: nil)
}

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}
