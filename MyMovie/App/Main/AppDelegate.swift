//
//  AppDelegate.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let assembler: Assembler = AppAssembler.shared
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let authVC: AuthViewController = assembler.resolve()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = authVC
        window?.makeKeyAndVisible()
        return true
    }

}

