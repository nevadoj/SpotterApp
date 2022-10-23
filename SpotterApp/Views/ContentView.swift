//
//  ContentView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
            .tabItem{
                Label("", systemImage: "figure.walk")
            }
            
            ProfileView()
                .tabItem{
                    Label("", systemImage: "person.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
