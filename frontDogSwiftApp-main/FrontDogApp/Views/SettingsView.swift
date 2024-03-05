//
//  SettingsView.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 17/01/2024.
//

import SwiftUI

struct SettingsView: View {
    // State variables for managing user preferences
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var selectedLanguage = "English"

    var body: some View {
        VStack {
            // Form for organizing settings sections
            Form {
                // Preferences Section
                Section(header: Text("Preferences")) {
                    // Toggle for enabling/disabling notifications
                    Toggle("Notifications", isOn: $notificationsEnabled)
                    
                    // Toggle for enabling/disabling dark mode
                    Toggle("Dark Mode", isOn: $darkModeEnabled)
                    
                    // Picker for selecting language
                    Picker("Language", selection: $selectedLanguage) {
                        Text("English").tag("English")
                        Text("French").tag("French")
                        Text("Spanish").tag("Spanish")
                    }
                }

                // Account Section
                Section(header: Text("Account")) {
                    // Button for logging out (example action provided)
                    Button(action: {
                        // Add your logout logic here
                    }) {
                        Text("Déconnexion") // Logout in French
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .frame(height: 660)
    }
}

#Preview {
    // Preview the SettingsView
    SettingsView()
}
