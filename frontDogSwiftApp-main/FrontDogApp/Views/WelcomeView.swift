//
//  WelcomeView.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 05/03/2024.
//

import SwiftUI

struct WelcomeView: View {
    // Array of dog options
    var dogOptions: Array<String> = ["dog_option_1", "dog_option_2", "dog_option_3"]
    
    // State variables for user input and error handling
    @State var welcomePassed: Bool
    @State var selectedDog = ""
    @State var userName: String = ""
    @State var userLocation: String = ""
    @State var errorGuardMessage: String = "You have to choose a username, dog, and location to continue !!!"
    @State var isErrorMessage: Bool = false
    
    // ObservedObject for managing the WelcomeModel
    @ObservedObject var welcomeModel: WelcomeModel
    
    var body: some View {
        VStack {
            // Title and message display
            VStack {
                Text("HEY")
                    .font(.title)
                    .fontWeight(.bold)
                    .monospaced()
                    .frame(width: 300)
                
                Text(!isErrorMessage ? "Choose a username and a Dog & give us your location" : errorGuardMessage)
                    .multilineTextAlignment(.center)
                    .bold()
                    .monospaced()
                    .foregroundColor(isErrorMessage ? Color.red : Color.white)
                    .frame(width: 300, height: 200)
            }
            .frame(width: 400, height: 100)
            
            Spacer()
            
            // TextFields for user input (username and location)
            TextField("Enter your username", text: $userName)
                .padding()
                .frame(width: 300)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
                .multilineTextAlignment(.center)
            
            TextField("Enter your Location", text: $userLocation)
                .padding()
                .frame(width: 300)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            // Image chips for selecting a dog option
            HStack(spacing: 10) {
                ForEach(dogOptions, id: \.self) { dogOption in
                    Button(action: {
                        selectedDog = dogOption
                    }) {
                        Image(dogOption)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .background(selectedDog == dogOption ? Color.blue : Color.gray)
                            .clipShape(Circle())
                    }
                    .overlay(
                        Circle()
                            .stroke(selectedDog == dogOption ? Color.blue : Color.clear, lineWidth: 4)
                    )
                }
            }
            
            Spacer()
            
            // Continue button to complete the welcome process
            Button("Continue") {
                guard !userName.isEmpty && !userLocation.isEmpty && !selectedDog.isEmpty else {
                    isErrorMessage = true
                    return
                }
                welcomeModel.completeWelcome(userName: userName, userPicture: selectedDog, userLocation: userLocation)
            }
            .frame(width: 300)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
        }
        .frame(width: 400, height: 600)
    }
}

#Preview {
    WelcomeView(welcomePassed: false, welcomeModel: WelcomeModel())
}
