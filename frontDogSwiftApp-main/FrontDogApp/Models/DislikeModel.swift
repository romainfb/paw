//
//  DislikeModel.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 02/03/2024.
//

import Foundation

struct Dislike: Codable {
    var dislikingUserID: Int
    var dislikedUserID: Int
}
struct DislikeResponse: Codable {
    var matches: [DogMatch]
}
