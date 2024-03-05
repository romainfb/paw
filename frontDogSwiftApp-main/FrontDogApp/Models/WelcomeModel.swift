//
//  WelcomeModel.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 05/03/2024.
//

import Foundation

class WelcomeModel: ObservableObject {
    @Published var welcomePassed: Bool = false
    @Published var userName: String = ""
    @Published var userPicture: String = ""
    @Published var userLocation: String = ""

    // Fonction pour simuler la fin du processus d'accueil
    func completeWelcome(userName: String, userPicture: String, userLocation: String) {
           self.userName = userName
           self.userPicture = userPicture
           self.userLocation = userLocation
           self.welcomePassed = true
       }}
