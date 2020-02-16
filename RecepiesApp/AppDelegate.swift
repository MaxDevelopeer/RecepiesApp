//
//  AppDelegate.swift
//  RecepiesApp
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
        
        let service = RecipesService()
        let recipesViewModel = RecipesListScreenViewModel(recipesService: service)
        //let vc = CollectionScreenViewController(nibName: "CollectionScreenViewController", bundle: nil)
        let vc = RecipesListScreenViewController(recipesListScreenViewModel: recipesViewModel)//ObjectScreenViewController(collectionObjectViewModel: collectionViewModel)
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        
        return true
    }


}

