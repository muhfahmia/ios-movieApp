//
//  UIAlertController.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation
import UIKit
import AudioToolbox

extension UIAlertController {
    @available(iOSApplicationExtension, unavailable)
    @available(visionOS, unavailable)
    func show(animated: Bool = true, vibrate: Bool = false, completion: (() -> Void)? = nil) {
        #if targetEnvironment(macCatalyst)
        let window = UIApplication.shared.windows.last
        #else
        let window = UIApplication.shared.keyWindow
        #endif
        window?.rootViewController?.present(self, animated: animated, completion: completion)
        if vibrate {
            #if canImport(AudioToolbox)
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            #endif
        }
    }
}
