//
//  AppDelegate.swift
//  Messenger
//
//  Created by  Aleksandr Afrikanov on 01.03.2020.
//  Copyright © 2020  Aleksandr Afrikanov. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let stateFrom = "Unattached"
        let stateTo = "Inactive"
        print("Application moved from \(stateFrom) to \(stateTo): \(#function)")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        let stateFrom = "Active"
        let stateTo = "Inactive"
        print("Application moved from \(stateFrom) to \(stateTo): \(#function)")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        let stateFrom = "Inactive"
        let stateTo = "Background"
        print("Application moved from \(stateFrom) to \(stateTo): \(#function)")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        let stateFrom = "Background"
        let stateTo = "Inactive"
        print("Application moved from \(stateFrom) to \(stateTo): \(#function)")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        let stateFrom = "Inactive"
        let stateTo = "Active"
        print("Application moved from \(stateFrom) to \(stateTo): \(#function)")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        let stateFrom = "Background"
        let stateTo = "Suspended"
        print("Application moved from \(stateFrom) to \(stateTo): \(#function)")
    }
}
