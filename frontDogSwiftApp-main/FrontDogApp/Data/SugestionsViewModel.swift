//
//  SugestionsViewModel.swift
//  FrontDogApp
//
//  Created by Thibault Garrigues on 19/01/2024.
//

import Foundation

class SugestionsViewModel: ObservableObject {
    @Published var sugestions = [Sugestion]()
    @Published var isSuggestionDataLoading: Bool = false
    
    
    func getSugestions() async {
        isSuggestionDataLoading = true
        guard let url = URL(string: "https://sdv-bdx.fr/api/v1/paw/suggest/2") else {
            print("URL is Invalid")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let decodedResponse = try JSONDecoder().decode(SugestionsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.isSuggestionDataLoading = false
                    self.sugestions = decodedResponse.express
                    
                }
                
            } catch {
                isSuggestionDataLoading = false
                print("JSON Decoding Error: \(error)")
            }
        } catch {
            isSuggestionDataLoading = false
            print("Network Request Error: \(error)")
        }
    }
    
    func resetSuggestions() async {
        // URL creation and validation
        guard let url = URL(string: "https://sdv-bdx.fr/api/v1/paw/like/1") else {
            print("Invalid URL")
            return
        }

        // Network request
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // JSON decoding
            do {
                print("suggestions have been reset")
                     
                }
            } catch {
                print("JSON decoding error: \(error)")
            }
        
    }
}
