//
//  MessagesView.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 17/01/2024.
//

import SwiftUI

struct MessagesView: View {
    let conversations: [Conversation] = [
          Conversation(name: "Conversation 1", messages: [
              Message(sender: "John", content: "Hello Alice!"),
              Message(sender: "Alice", content: "Hi John!")
          ]),
          Conversation(name: "Conversation 2", messages: [
              Message(sender: "Bob", content: "Hey Charlie!"),
              Message(sender: "Charlie", content: "Hi Bob!")
          ]),
          // Ajoutez d'autres conversations si nécessaire
      ]

    @State private var selectedConversation: UUID?
    var body: some View {
           NavigationView {
               List(conversations) { conversation in
                   NavigationLink(destination: MessagesDetailView(messages: conversation.messages)) {
                       Text("Conversation with \(conversation.name)")
                           .onTapGesture {
                               selectedConversation = conversation.id
                           }
                   }
               }
               .navigationBarHidden(true)
               .listStyle(PlainListStyle())
           }
       }
   }




#Preview {
    MessagesView()
}
