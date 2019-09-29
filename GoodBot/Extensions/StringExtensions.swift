//
//  StringExtensions.swift
//  GoodBot
//
//  Created by Gary Pan on 9/28/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
