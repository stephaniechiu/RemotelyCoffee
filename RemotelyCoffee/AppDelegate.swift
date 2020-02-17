//
//  AppDelegate.swift
//  RemotelyCoffee
//
//  Created by Stephanie on 2/12/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let service = MoyaProvider<YelpService.BusinessesProvider>()
    let jsonDecoder = JSONDecoder()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        service.request(.search(lat: 34.03894, long: -118.314735)) { (result) in
            switch result {
            case .success(let response):
                let root = try? self.jsonDecoder.decode(Root.self, from: response.data)
                let viewModels = root?.businesses.compactMap(CoffeeShopListViewModel.init)
                //print(try? JSONSerialization.jsonObject(with: response.data, options: []))
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        return true
    }
    
    private func loadBusinesses() {
        service.request(.search(lat: 34.03894, long: -118.314735)) { (result) in
            switch result {
            case .success(let response):
                let root = try? self.jsonDecoder.decode(Root.self, from: response.data)
                let viewModels = root?.businesses.compactMap(CoffeeShopListViewModel.init)
                //print(try? JSONSerialization.jsonObject(with: response.data, options: []))
                
            //To link view model to view controller
                if let nav = self.window.rootViewController as? UINavigationController,
                    let coffeeShopListViewController = nav.topViewController as? CoffeeShopTableViewController {
                    coffeeShopListViewController.viewModels = viewModels ?? []
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    // MARK: - UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

