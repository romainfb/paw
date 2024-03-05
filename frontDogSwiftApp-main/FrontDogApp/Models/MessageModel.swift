//
//  MessageModel.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 02/03/2024.
//

import Foundation


struct Message: Identifiable {
    var id: UUID = UUID()
    var sender: String
    var content: String
}

struct Conversation: Identifiable {
  var id: UUID = UUID()
  var name: String
  var messages: [Message] = []
}
