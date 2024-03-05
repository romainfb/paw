//
//  MessagesDetailView.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 02/03/2024.
//

import SwiftUI

struct MessagesDetailView: View {
    var messages: [Message]

    var body: some View {
        VStack {
            List(messages) { message in
                MessageRow(message: message)
            }
            .navigationBarTitle(messages.first?.sender ?? "", displayMode: .inline)
        }
    }
}


//#Preview {
//    MessagesDetailView([Message: ])
//}
