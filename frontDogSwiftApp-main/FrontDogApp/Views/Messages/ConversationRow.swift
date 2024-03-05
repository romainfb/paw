//
//  ConversationRow.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 02/03/2024.
//

import SwiftUI

struct ConversationRow: View {
    var conversation: Conversation

    var body: some View {
        VStack(alignment: .leading) {
            Text(conversation.name)
                .font(.headline)
                .foregroundColor(.black)
            Text(conversation.messages.last?.content ?? "")
                .foregroundColor(.gray)
        }
        .padding(10)
    }
}

