//
//  NavBar.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/23/24.
//


import SwiftUI

struct NavBar: View {
    @State private var selection = 1
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    var body: some View {
        TabView(selection: $selection) {
            HomeView().tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
            }.tag(1)
            
            CheckOut().tabItem {
                VStack {
                    Image(systemName: "heart.fill")
                    Text("Requests")
                }
                
            }.tag(2)
            
            Tasks().tabItem {
                VStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Tasks")
                }
                
            }.tag(3)
            
            Profile().tabItem {
                VStack {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
                
            }.tag(4)
            
        }
        .accentColor(.orange)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}

