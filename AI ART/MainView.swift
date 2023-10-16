//
//  MainView.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 20/9/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var data = DataModel()
    var body: some View {
        TabView {
            SelfieView(data: data)
                .tabItem {
                    Label("AI Selfies", systemImage: "face.smiling")
                }

            AvatarsView()
                .tabItem {
                    Label("Avatars", systemImage: "person.fill.viewfinder")
                }
            AvatarsView()
                .tabItem {
                    Label("Generate", systemImage: "wand.and.stars")
                }
            AvatarsView()
                .tabItem {
                    Label("Videos", systemImage: "play.rectangle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
