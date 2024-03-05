//
//  SugestionModel.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 19/01/2024.
//

import Foundation


import Foundation

struct Sugestion: Codable {
    var userID: Int
    var userName: String
    var dogName: String
    var dogBreed: String
    var dogAge: Int
    var dogPhoto: String
}

struct SugestionsResponse: Codable {
    var express: [Sugestion]
}
