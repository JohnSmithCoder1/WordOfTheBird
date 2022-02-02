//
//  AppDelegate.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 4/25/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var managedObjectContext: NSManagedObjectContext = persistentContainer.viewContext
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: {
            storeDescription, error in
            if let error = error {
                fatalError("Could load data store: \(error)") // could NOT load?
            }
        })
        return container
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabController = window!.rootViewController as! UITabBarController
        
        if let tabViewControllers = tabController.viewControllers {
            var navController = tabViewControllers[1] as! UINavigationController
            
            let controller1 = navController.viewControllers.first as! PinLocationViewController
            controller1.managedObjectContext = managedObjectContext
            navController = tabViewControllers[2] as! UINavigationController
            
            let controller2 = navController.viewControllers.first as! PinListViewController
            controller2.managedObjectContext = managedObjectContext
            let _ = controller2.view // loads view automatically to work around IOS bug, option-click .view for details
            
            navController = tabViewControllers[3] as! UINavigationController
            let controller4 = navController.viewControllers.first as! PinMapViewController
            controller4.managedObjectContext = managedObjectContext
            
            print(applicationDocumentsDirectory)
        }
      
        if #available(iOS 15, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = UIColor(red: 79.0/255.0, green: 143/255.0, blue: 0.0/255.0, alpha: 1.0)
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
          
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor(red: 79.0/255.0, green: 143/255.0, blue: 0.0/255.0, alpha: 1.0)
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
      
        listenForFatalCoreDataNotifications()
        return true
    }
    
    func listenForFatalCoreDataNotifications() {
        NotificationCenter.default.addObserver(forName: CoreDataSaveFailedNotification, object: nil, queue: OperationQueue.main, using: {
            notification in
            let message = "There was a fatal error in the app and it cannot continue./nPress OK to terminate the app. Sorry for the inconvenience."
            let alert = UIAlertController(title: "Internal Error", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                let exception = NSException(name: NSExceptionName.internalInconsistencyException, reason: "Fatal Core Data error", userInfo: nil)
                exception.raise()
            }
            alert.addAction(action)
            let tabController = self.window!.rootViewController!
            tabController.present(alert, animated: true, completion: nil)
        })
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
