//
//  CardView.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 18/01/2024.
//

import SwiftUI

struct CardView: View {
    // Dog object representing the data for the card
    var dog: Sugestion

    var body: some View {
        ZStack {
            // Background rectangle for the card
            Rectangle()
                .frame(width: 350, height: 600)
                .opacity(0)
                .background(.ultraThinMaterial)
                .cornerRadius(30)
            
            ZStack {
                // Main content rectangle with white background
                Rectangle()
                    .frame(width: 320, height: 480)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
                
                // Image of the dog using AsyncImage
                AsyncImage(url: URL(string: dog.dogPhoto)) { image in
                    image
                        .resizable()
                        .cornerRadius(30)
                } placeholder: {
                    ProgressView()
                }
                
                VStack {
                    // Badge for distance
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 100, height: 40)
                            .background(.ultraThinMaterial)
                            .opacity(0.6)
                            .cornerRadius(30)
                            .position(CGPoint(x: 260.0, y: 40.0))
                        
                        Text("1.2km")
                            .foregroundColor(Color.white)
                            .font(.headline)
                            .position(CGPoint(x: 260.0, y: 40.0))
                    }
                    
                    VStack {
                        // Dog's name and age
                        HStack {
                            Text(dog.dogName.capitalized)
                                .font(.title)
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                            
                            Text("\(dog.dogAge) ans")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(width: 280.0, alignment: .leading)
                        .padding(2.0)
                        
                        // Dog's description (placeholder text)
                        Text("missing description".capitalized.capitalized)
                            .foregroundColor(Color.white)
                            .frame(width: 280.0, alignment: .leading)
                    }
                    .padding()
                }
            }
            .frame(width: 320, height: 480)
            .offset(y: -40)
            
            // Buttons for actions (like and dislike)
            HStack(spacing: 20) {
                // Dislike button
                Button(action: {
                    // Action for the first button (dislike)
                }) {
                    Circle()
                        .foregroundColor(.red)
                        .frame(width: 100, height: 50)
                        .overlay(
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                        )
                }
                
                // Like button
                Button(action: {
                    // Action for the second button (like)
                }) {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 100, height: 50)
                        .overlay(
                            Image(systemName: "heart")
                                .foregroundColor(.white))
                }
            }
            .offset(y: 250)
        }
    }
}

#Preview {
    // Preview the CardView with a placeholder Sugestion object
    CardView(dog: Sugestion(
        userID: 2,
        userName: "hello",
        dogName: "hello",
        dogBreed: "hello",
        dogAge: 100,
        dogPhoto: "https://sdv-bdx.fr/api/v1/paw/images/labrador.jpg"
    ))
}
