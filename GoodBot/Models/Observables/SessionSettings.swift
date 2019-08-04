//
//  SessionSettings.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI
import Combine


class SessionSettings: ObservableObject {
    @Published var navigationTitle = "r/popular"
    
    func changeNavigationTitle(title: String) {
        self.navigationTitle = title
    }
}
