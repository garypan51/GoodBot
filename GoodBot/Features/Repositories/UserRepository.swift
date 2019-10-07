//
//  UserRepository.swift
//  GoodBot
//
//  Created by Gary Pan on 10/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import Foundation

struct UserRepository {
    static let shared = UserRepository()
    private init(){}
    
    let userDefaults = UserDefaults.standard
    
    func saveUser() {
        
    }

    func loadUser() {
//        let decoded  = userDefaults.data(forKey: "user")
//        let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Team]
    }

    func deleteUser() {
        
    }
    
    func saveAccessToken(accessToken: AccessToken) {
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: accessToken, requiringSecureCoding: false)
            userDefaults.set(encodedData, forKey: "accessToken")
            userDefaults.synchronize()
            print("Saved")
        } catch {
            fatalError("Can't encode data: \(error)")
        }
    }

    func loadAccessToken() -> AccessToken? {
        guard let decoded = userDefaults.data(forKey: "accessToken")
            else {
                print("key not found")
                return nil
        }
        do {
            guard let accessToken = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as? AccessToken else {
                fatalError("Can't get access Token")
            }
            return accessToken
        } catch {
            print("Error info: \(error)")

        }
        return nil
    }
    
        

    func deleteAccessToken() {
        
    }
}
