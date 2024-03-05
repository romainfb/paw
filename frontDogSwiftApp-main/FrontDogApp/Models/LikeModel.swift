//
//  LikeModel.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 02/03/2024.
//

import Foundation


struct Like: Codable {
    var userLikingID: Int
    var userLikedID: Int
}
struct LikeResponse: Codable {
    var matches: [DogMatch]
}
