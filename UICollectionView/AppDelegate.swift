//
//  AppDelegate.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 23.02.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        populateProfiles()
        planetInfo()
        
        
        window = UIWindow()
        window?.frame = UIScreen.main.bounds

        let vc = MainVC()
        let navigationController = UINavigationController(rootViewController: vc)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

