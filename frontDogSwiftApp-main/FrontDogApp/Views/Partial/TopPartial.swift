//
//  TopPartial.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 17/01/2024.
//

import SwiftUI

struct TopPartial: View {
    // ObservedObject for managing the welcome model
    @ObservedObject var welcomeModel: WelcomeModel
    
    var body: some View {
        HStack {
            // Avatar
            Image(welcomeModel.userPicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color.black)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                .shadow(radius: 4)
            
            // Localization
            HStack {
                Image(systemName: "location")
                Text(welcomeModel.userLocation)
                    .font(Font.custom("Degular-Regular", size: 20))
                    .kerning(5.0) // Letter spacing
                    .padding()
            }
            .frame(width: 230)
        }//:HStack
        .padding(.top, 55.0)
        .onAppear {
            // Additional logic to execute when the view appears
        }
    }
}

#Preview {
    // Use a constant string as a placeholder for the welcomeModel
    TopPartial(welcomeModel: WelcomeModel())
}
