//
//  UserSessionDataSource.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation


struct UserSession {
    static let shared = UserSession()
    
    private let userDefaults = UserDefaults.standard
    private let tokenKey = "userToken"
    private let authKey = "userAuth"
    private let usernameKey = "userName"
    
    var token: String? {
        get {
            return userDefaults.string(forKey: tokenKey)
        }
        set {
            userDefaults.set(newValue, forKey: tokenKey)
        }
    }
    
    var isLogin: Bool? {
        get {
            return userDefaults.bool(forKey: authKey)
        }
        set {
            userDefaults.set(newValue, forKey: authKey)
        }
    }
    
    var username: String? {
        get {
            return userDefaults.string(forKey: usernameKey)
        }
        set {
            userDefaults.set(newValue, forKey: usernameKey)
        }
    }
    
}
