//
//  MainView.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 18/01/2024.
//

import SwiftUI

struct MainView: View {
    // State variable to keep track of the selected tab
    @State private var selectedTab = "Home"
    
    // StateObject for managing the WelcomeModel
    @StateObject public var welcomeModel = WelcomeModel()

    var body: some View {
        // Check if the welcome screen has been passed
        if !welcomeModel.welcomePassed {
            WelcomeView(welcomePassed: welcomeModel.welcomePassed, welcomeModel: welcomeModel)
        } else {
            ZStack(alignment: .top) {
                // Main TabView containing different sections of the app
                TabView(selection: $selectedTab) {
                    
                    // MARK: HOME
                    NavigationView {
                        HomeView()
                    }
                    .tabItem {
                        Image(systemName: "crop")
                        Text("Home")
                    }
                    .tag("Home")
                    
                    // MARK: MATCHES
                    NavigationView {
                        MatchsView(selectedTab: $selectedTab)
                    }
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Matches")
                    }
                    .tag("Matches")
                    
                    // MARK: MESSAGES
                    NavigationView {
                        MessagesView()
                    }
                    .tabItem {
                        Image(systemName: "ellipsis.message")
                        Text("Messages")
                    }
                    .tag("Messages")
                    
                    // MARK: SETTINGS
                    SettingsView()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                        .tag("Settings")
                }
                
                // Display the top partial view only for certain tabs
                if selectedTab != "Settings" &&
                   selectedTab != "Messages" &&
                   selectedTab != "MatchDetail"
                {
                    TopPartial(welcomeModel: welcomeModel)
                        .zIndex(1)
                }
            }
            .ignoresSafeArea()
        }
    }
}

// Preview the MainView
#Preview {
    MainView()
}
