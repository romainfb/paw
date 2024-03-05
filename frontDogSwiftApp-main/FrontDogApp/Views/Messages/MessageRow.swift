
//  MessageRow.swift
  //FrontDogApp

 // Created by Thibault Garrigues on 02/03/2024.


import SwiftUI

struct MessageRow: View {
    var message: Message

    var body: some View {
        HStack {
            if message.sender == "John" {
                Spacer()
            }
            Text(message.content)
                .padding(10)
                .background(message.sender == "John" ? Color.blue : Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            if message.sender == "Alice" {
                Spacer()
            }
        }
    }
}

//#Preview {
//    MessageRow(message: message)
//}
