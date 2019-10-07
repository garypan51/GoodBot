//
//  AccessToken.swift
//  GoodBot
//
//  Created by Gary Pan on 10/1/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import Foundation

class AccessToken: NSObject, NSCoding, Decodable {
    var accessToken, refreshToken, tokenType, scope: String
    var expiresIn: Int
    var dateCreated = Date()
    
    private enum CodingKeys: String, CodingKey { case accessToken, refreshToken, tokenType, scope, expiresIn }

    
    init(accessToken: String, refreshToken: String, tokenType: String, scope: String, expiresIn: Int, dateCreated: Date) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.tokenType = tokenType
        self.scope = scope
        self.expiresIn = expiresIn
        self.dateCreated = dateCreated
    }

    required convenience init(coder aDecoder: NSCoder) {
        let accessToken = aDecoder.decodeObject(forKey: "accessToken") as! String
        let refreshToken = aDecoder.decodeObject(forKey: "refreshToken") as! String
        let tokenType = aDecoder.decodeObject(forKey: "tokenType") as! String
        let scope = aDecoder.decodeObject(forKey: "scope") as! String
        let expiresIn = aDecoder.decodeInteger(forKey: "expiresIn")
        let dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date

        self.init(accessToken: accessToken, refreshToken: refreshToken, tokenType: tokenType, scope: scope, expiresIn: expiresIn, dateCreated: dateCreated)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(accessToken, forKey: "accessToken")
        aCoder.encode(refreshToken, forKey: "refreshToken")
        aCoder.encode(tokenType, forKey: "tokenType")
        aCoder.encode(refreshToken, forKey: "scope")
        aCoder.encode(expiresIn, forKey: "expiresIn")
        aCoder.encode(dateCreated, forKey: "dateCreated")
    }
}
