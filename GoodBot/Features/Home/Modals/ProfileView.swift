//
//  ProfileView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/1/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        // if not signed in show sign in oauth modal
        
        // else show profile
        ScrollView {
            Text("Name")
            Text("UserName")
            Text("Karma")
        }
    }
}

#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif
