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
    var vc: UIViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let authUseCase: AuthUseCase = assembler.resolve()
        
        authUseCase.checkAuthUser { isLoggedIn in
            if isLoggedIn {
                let homeVC: HomeViewController = self.assembler.resolve()
                self.vc = UINavigationController(rootViewController: homeVC)
            } else {
                let authVC: AuthViewController = self.assembler.resolve()
                self.vc = UINavigationController(rootViewController: authVC)
            }
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
    
    func routeToHome() {
        let homeVC: HomeViewController = assembler.resolve() // Your main application view controller
        self.window?.rootViewController = UINavigationController(rootViewController: homeVC)
    }

}

