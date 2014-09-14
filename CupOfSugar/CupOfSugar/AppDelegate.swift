//
//  AppDelegate.swift
//  CupOfSugar
//
//  Created by Kashish Hora on 9/12/14.
//  Copyright (c) 2014 Kashish Hora. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var locationManager: CLLocationManager = CLLocationManager()
    var location: CLLocation?
    var navigationController: UINavigationController?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window!.tintColor = UIColor(red: 241/255.0, green: 136/255.0, blue: 43/255.0, alpha: 1.0)
        
        navigationController = UINavigationController(rootViewController: LoginViewController())
        navigationController!.navigationBarHidden = true
        
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        if launchOptions != nil {
            
            let userInfo: NSDictionary = launchOptions![UIApplicationLaunchOptionsRemoteNotificationKey] as NSDictionary
            
            let personFirstName: String? = userInfo["firstName"] as NSString
            let requestedItem: String? = userInfo["requestedItem"] as NSString
            
            let contactViewController = ContactViewController()
            contactViewController.firstName = personFirstName
            contactViewController.requestedItem = requestedItem
            
            navigationController!.pushViewController(contactViewController, animated: false)
        }
        
        initLocationManager()
        
        Parse.setApplicationId("SlLRqtDihroj3xR6YZYSMibXCBftVQlty4Aq96nP", clientKey: "eXC4QeKDQCA4YyM1pGxibVOo9KAQDqIoUsFzNP0T")
        
        let version: NSString = UIDevice.currentDevice().systemVersion
        if (version.floatValue >= 8.0) {
            application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: .Alert | .Sound | .Badge, categories: nil))
            application.registerForRemoteNotifications()
        }
        else {
            application.registerForRemoteNotificationTypes(.Sound | .Alert | .Badge)
        }
        
        return true
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        // Store the deviceToken in the current installation and save it to Parse.
        let currentInstallation = PFInstallation.currentInstallation()
        currentInstallation.setDeviceTokenFromData(deviceToken)
        currentInstallation.channels = ["global"]
        currentInstallation.saveInBackground()
    }

    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        let personFirstName: String? = userInfo["firstName"] as NSString
        let requestedItem: String? = userInfo["requestedItem"] as NSString
        
        let contactViewController = ContactViewController()
        contactViewController.firstName = personFirstName
        contactViewController.requestedItem = requestedItem
        
        navigationController!.pushViewController(contactViewController, animated: false)
    }
    func applicationDidEnterBackground(application: UIApplication) {
        locationManager.stopUpdatingLocation()
    }
}

