//
//  AppDelegate.swift
//  RijksmuseumApp
//
//  Created by Maxim on 09/02/2020.
//  Copyright © 2020 maxim.kruchinin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
      window = UIWindow(frame: UIScreen.main.bounds)
        
        let service = CollectionObjectService()
        let vc = ObjectScreenViewController(collectionService: service)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }


}

