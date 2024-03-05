//
//  HomeView.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 17/01/2024.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        // Display the CardHomePartial view with a top padding
        CardHomePartial()
            .padding(.top, 45.0)
    }
}

#Preview {
    // Preview the HomeView
    HomeView()
}
