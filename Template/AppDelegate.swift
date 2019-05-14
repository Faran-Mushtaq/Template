//
//  AppDelegate.swift
//
//  Created by Faran on 10/12/2018.
//  Copyright © 2018 Faran. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps
import GooglePlaces

var router = Router()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        basicSetup()
        return true
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
    
    
    func basicSetup()  {
        
        //UINavigationBar.appearance().barStyle = .blackOpaque
        
        LeakInspector.delegate = LeakInspectorAlertProvider()
        IQKeyboardManager.shared.enable = true
        
        //    GMSServices.provideAPIKey("AIzaSyD_r6ObZd3snkFuAPiU1B_d0UM1yTBwtUQ")
        //    GMSPlacesClient.provideAPIKey("AIzaSyD_r6ObZd3snkFuAPiU1B_d0UM1yTBwtUQ")
        
        GMSServices.provideAPIKey("AIzaSyAt-DRxRLnWVkdUZUA7dBnXqEXxZErjR6o")
        GMSPlacesClient.provideAPIKey("AIzaSyAt-DRxRLnWVkdUZUA7dBnXqEXxZErjR6o")
        
    }
}

