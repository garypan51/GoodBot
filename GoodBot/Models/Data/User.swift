//
//  User.swift
//  GoodBot
//
//  Created by Gary Pan on 9/27/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    var id: Int
    var name: String
    var shortname: String


    init(id: Int, name: String, shortname: String) {
        self.id = id
        self.name = name
        self.shortname = shortname
    }

    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeInteger(forKey: "id")
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let shortname = aDecoder.decodeObject(forKey: "shortname") as! String
        self.init(id: id, name: name, shortname: shortname)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(shortname, forKey: "shortname")
    }
}
