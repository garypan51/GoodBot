//
//  ContentView.swift
//  GoodBot
//
//  Created by Gary Pan on 7/30/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionSettings: SessionSettings
    @State private var profileModalPresented = false
    
    var body: some View {
        NavigationView {
            HomeView()
                .navigationBarTitle(self.sessionSettings.navigationTitle)
                .navigationBarItems(leading: Button(action: {self.showProfileModal()}) {
                    Text("Profile")
                })
        }.sheet(isPresented: $profileModalPresented, content: { ProfileView() })
    }
    
    func showProfileModal() {
        profileModalPresented = true
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
