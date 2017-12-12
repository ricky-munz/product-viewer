//
//  AppDelegate.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/10/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let leftCollectionViewMargin = 12
        let rightCollectionViewMargin = 12
        let itemHorizontalPadding = 8
        let widthSpacing = leftCollectionViewMargin + rightCollectionViewMargin + itemHorizontalPadding
        
        let itemWidth = Int(UIScreen.main.bounds.size.width) - widthSpacing
        
        let topCollectionViewMargin = 24
        let itemVerticalPadding = 24
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = CGFloat(itemVerticalPadding)
        flowLayout.minimumInteritemSpacing = CGFloat(itemHorizontalPadding)

        flowLayout.sectionInset = UIEdgeInsets(top: CGFloat(topCollectionViewMargin), left: CGFloat(leftCollectionViewMargin), bottom: 0, right: CGFloat(rightCollectionViewMargin))
        flowLayout.itemSize = CGSize(width: itemWidth/2, height: itemWidth/2)
        let offersViewController = OffersViewController(collectionViewLayout: flowLayout)
        
        UINavigationBar.appearance().barTintColor = .mainAppColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        
        window?.rootViewController = UINavigationController(rootViewController: offersViewController)
        
        application.statusBarStyle = .lightContent
        
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


}

