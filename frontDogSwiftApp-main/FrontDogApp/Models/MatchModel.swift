//
//  DogMatch.swift
//  Matches
//
//  Created by Thibault Garrigues on 18/01/2024.
//

import Foundation


struct DogMatch: Codable {
    var userID: Int
    var userName: String
    var dogName: String
    var dogBreed: String
    var dogAge: Int
    var dogPhoto: String
}
struct MatchesResponse: Codable {
    var matches: [DogMatch]
}

extension DogMatch {
    static let previewMatchs: DogMatch = DogMatch(userID: 1, userName: "Emma", dogName: "cooper",dogBreed: "Labrador", dogAge: 2, dogPhoto: "https://sdv-bdx.fr/api/v1/paw/images/labrador.jpg")
}
