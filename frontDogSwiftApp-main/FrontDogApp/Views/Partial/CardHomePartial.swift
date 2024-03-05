//
//  CardHomePartial.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 17/01/2024.
//

import SwiftUI

//MARK: PROPERTIES - No properties to comment on

//MARK: VIEW
struct CardHomePartial: View {
    // StateObjects for managing view models and UI states
    @StateObject var suggestionsViewModel = SugestionsViewModel()
    @StateObject var dogMatchModel = DogMatchModel()
    @State private var userId = 1
    @State private var offset: CGSize = .zero
    @State private var currentIndex: Int = 0
    @State private var showHeartIcon: Bool = false
    @State private var showCrossIcon: Bool = false
    @State private var opacityLevel: Double = 0.0
    @State private var haveSeen: Int = 0;

    // Function to handle swiping right
    func handleSwipeRight() async {
        let currentDog = suggestionsViewModel.sugestions[currentIndex]
        let Like = Like(userLikingID: userId, userLikedID: currentDog.userID)
        haveSeen += 1
        if haveSeen == suggestionsViewModel.sugestions.count {
            await suggestionsViewModel.getSugestions()
            haveSeen = 0
        }
        await dogMatchModel.postLike(data: Like)
    }

    // Function to handle swiping left
    func handleSwipeLeft() async {
        let currentDog = suggestionsViewModel.sugestions[currentIndex]
        let Dislike = Dislike(dislikingUserID: userId, dislikedUserID: currentDog.userID)
        await dogMatchModel.postDislike(data: Dislike)
        haveSeen += 1
        if haveSeen == suggestionsViewModel.sugestions.count {
            await suggestionsViewModel.getSugestions()
            haveSeen = 0
        }
        currentIndex = min(currentIndex + 1, suggestionsViewModel.sugestions.count - 1)
    }

    var body: some View {
        ZStack {
            if(!dogMatchModel.isMatchDataLoading){
                ForEach(suggestionsViewModel.sugestions.indices, id: \.self) { index in
                    let dog = suggestionsViewModel.sugestions[index]
                    
                    // Background
                    let nextIndex = (index + 1) % suggestionsViewModel.sugestions.count
                    let nextDog = suggestionsViewModel.sugestions[nextIndex]
                    if let url = URL(string: nextDog.dogPhoto) {
                        AsyncImage(url: url) { image in
                            CardView(dog: nextDog)
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                                .scaleEffect(2.0, anchor: .center)
                        }
                    }
                    
                    // Foreground
                    if URL(string: dog.dogPhoto) != nil {
                        CardView(dog: dog)
                            .offset(x: currentIndex == index ? offset.width : CGFloat(index - currentIndex) * 320, y: 0)
                            .rotationEffect(Angle(degrees: currentIndex == index ? Double(offset.width / 10) : 0))
                            .opacity(currentIndex == index ? 1 : 0)
                            .zIndex(Double(suggestionsViewModel.sugestions.count - index))
                            .shadow(radius: 10)
                    }
                }
            } else {
                ProgressView()
            }
        }//: - ZStack
        .frame(width: 400, height: 480)
        .gesture(
            DragGesture()
                .onChanged { value in
                    offset = value.translation
                    showHeartIcon = value.translation.width < 0
                    showCrossIcon = value.translation.width > 0
                    
                    // Adjust opacity based on translation
                    let absoluteTranslation = abs(value.translation.width)
                    let maxTranslation: CGFloat = 100.0 // Adjust according to your preferences
                    let normalizedOpacity = Double(absoluteTranslation / maxTranslation)
                    opacityLevel = min(normalizedOpacity, 1.0)
                }
                .onEnded { value in
                    let horizontalDirection = value.predictedEndLocation.x - value.location.x
                    if horizontalDirection > 0 {
                        // Swipe to the right
                        withAnimation {
                            offset = CGSize(width: 500, height: 0)
                            showHeartIcon = false
                            opacityLevel = 0.0
                        }
                        Task { await handleSwipeRight() }
                        currentIndex = min(currentIndex + 1, suggestionsViewModel.sugestions.count - 1)
                    } else if horizontalDirection < 0 {
                        // Swipe to the left
                        withAnimation {
                            offset = CGSize(width: -500, height: 0)
                            showCrossIcon = false
                            opacityLevel = 0.0
                        }
                        currentIndex = min(currentIndex + 1, suggestionsViewModel.sugestions.count - 1)
                        Task { await handleSwipeLeft() }
                    }
                    offset = .zero
                }
        )
        .onAppear {
            Task {
                await suggestionsViewModel.resetSuggestions()
                await suggestionsViewModel.getSugestions()
            }
        }
    }
}

//MARK: PREVIEW
#Preview {
    CardHomePartial()
}
