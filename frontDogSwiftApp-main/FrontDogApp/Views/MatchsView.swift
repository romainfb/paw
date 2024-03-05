//
//  MatchsView.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 17/01/2024.
//

import SwiftUI

struct MatchsView: View {
    // StateObject for managing DogMatchModel
    @StateObject var dogMatch = DogMatchModel()
    
    // Binding for the selectedTab, likely used for navigation
    @Binding var selectedTab: String
    
    // Sample data for dog matches
    var rawDogs: [DogMatch] = [
        DogMatch(userID: 51, userName: "Ezra", dogName: "Teddy", dogBreed: "French Bulldog", dogAge: 3, dogPhoto: "DEV_dogImage"),
        DogMatch(userID: 52, userName: "Mila", dogName: "Bailey", dogBreed: "Jack Russel", dogAge: 1, dogPhoto: "DEV_dogImage"),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 20) {
                    ForEach(rawDogs, id: \.userID) { match in
                        NavigationLink(destination: {
                            // Navigate to MatchDetail when tapped
                            MatchDetail(selectedTab: $selectedTab, dogDetail: match)
                        }) {
                            VStack {
                                // Asynchronous image loading
                                AsyncImage(url: URL(string: match.dogPhoto)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(10)
                                        .frame(width: 120, height: 85)
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack {
                                    Text(match.dogName)
                                        .font(.callout)
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: 80, height: 80)
                            .padding()
                            .cornerRadius(16)
                            .background(.ultraThinMaterial)
                            .opacity(1)
                            .cornerRadius(20)
                        }
                    }
                }
                .padding(.leading, 10.0)
                .padding(.trailing, 10.0)
            }
            .padding(.top, 80.0)
            .padding(.bottom, 30.0)
        }
        .onAppear {
            // Load dog match data on view appear
            Task {
                await dogMatch.getMatches()
                //print(dogMatch.dogMatches)
            }
        }
    }
}

#Preview {
    // Preview the MatchsView with a constant selectedTab value
    MatchsView(selectedTab: .constant("Matchs"))
}
