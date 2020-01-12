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
    }
    
    var profileButton: some View {
        NavigationLink(destination: ProfileModalView()) {
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
                .navigationBarTitle("Front Page")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
