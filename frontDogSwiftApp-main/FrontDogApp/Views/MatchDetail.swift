//
//  MatchDetail.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 26/02/2024.
//

import SwiftUI

struct MatchDetail: View {
    // Binding for selectedTab, likely used for navigation
    @Binding var selectedTab: String
    
    // State variable for storing the details of the selected dog match
    @State var dogDetail: DogMatch
   
    var body: some View {
        VStack {
            // Asynchronous image loading for the dog's photo
            AsyncImage(url: URL(string: dogDetail.dogPhoto)) { phase in
                switch phase {
                case .empty:
                    ProgressView() // Displays a spinner while loading
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill() // Preserves aspect ratio
                        .frame(height: 400)
                        .cornerRadius(16)
                        .padding(.top, 25)
                case .failure(_):
                    // Handle error gracefully
                    Text("An error occurred while loading the image.")
                @unknown default:
                    Text("An error occurred while loading the image.")
                }
            }
            
            // Buttons for user actions (Delete and Contact)
            HStack {
                Spacer()
                
                Button(action: {
                    // Action to be executed when the "Supprimer" button is clicked
                }) {
                    Text("Supprimer")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Button(action: {
                    // Action to be executed when the "Contacter" button is clicked
                }) {
                    Text("Contacter")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            
            // Displaying details about the dog match
            VStack {
                ZStack {
                    Rectangle()
                        .cornerRadius(30)
                        .background(.ultraThinMaterial)
                    
                    VStack {
                        Text(dogDetail.dogName)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: 380)
                        
                        Text(dogDetail.dogBreed)
                            .font(.title2)
                        
                        Text(dogDetail.userName)
                            .font(.title3)
                    }
                }
            }
        }
        .onAppear {
            // Perform tasks when the view appears
            Task {
                selectedTab = "MatchDetail"
                print(dogDetail)
                print(selectedTab)
                print("affichage de matchdetail")
            }
        }
    }
}

#Preview {
    // Preview the MatchDetail view with a sample DogMatch
    MatchDetail(
        selectedTab: .constant("MatchDetail"),
        dogDetail: DogMatch(userID: 10, userName: "Nathan", dogName: "Mia", dogBreed: "Husky", dogAge: 4, dogPhoto: "https://sdv-bdx.fr/api/v1/paw/images/husky.jpg")
    )
}
