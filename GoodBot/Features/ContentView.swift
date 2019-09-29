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
    @State private var showingProfile = false
    
    init() {
//        UINavigationBar.appearance().backgroundColor = .purple
    }
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            HomeView()
                .navigationBarItems(trailing: profileButton)

//                .navigationBarItems(trailing: Button(action: {self.showProfileModal()}) {
//                    Text("Profile")
//                })
//            .navigationBarTitle("Hello")

//                .navigationBarTitle(self.sessionSettings.navigationTitle)
                
//            .navigationBarHidden(true)

        }.sheet(isPresented: self.$showingProfile, content: { ProfileView() })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
