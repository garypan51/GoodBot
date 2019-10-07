//
//  DateExtensions.swift
//  GoodBot
//
//  Created by Gary Pan on 10/5/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import Foundation

extension Date {
    func hasPastBy(seconds: Int) -> Bool {
        let calendar = Calendar.current
        guard let dateToCheckIfPastBy = calendar.date(byAdding: .second, value: seconds, to: self) else {
            return false
        }
        return self >= dateToCheckIfPastBy
    }
}
