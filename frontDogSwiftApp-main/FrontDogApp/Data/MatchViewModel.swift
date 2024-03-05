import Foundation

class DogMatchModel: ObservableObject {
    @Published var dogMatches = [DogMatch]()
    @Published var newMatches = [Like]()
    @Published var isMatchDataLoading: Bool = false
    
    
    func getMatches() async {
        isMatchDataLoading = true

        guard let url = URL(string: "https://sdv-bdx.fr/api/v1/paw/matches/1") else {
            print("URL is Invalid")
            isMatchDataLoading = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let decodedResponse = try JSONDecoder().decode(MatchesResponse.self, from: data)

                // Update on the main thread using a closure for conciseness
                DispatchQueue.main.async {
                    self.dogMatches = decodedResponse.matches
                    self.isMatchDataLoading = false
                }
            } catch {
                print("JSON Decoding Error: \(error)")
                
                // Update isMatchDataLoading on the main thread in case of error
                DispatchQueue.main.async {
                    self.isMatchDataLoading = false
                }
            }
        } catch {
            print("Network Request Error: \(error)")
            
            // Update isMatchDataLoading on the main thread in case of error
            DispatchQueue.main.async {
                self.isMatchDataLoading = false
            }
        }
    }

    func postLike(data: Like) async {
        guard let url = URL(string: "https://sdv-bdx.fr/api/v1/paw/like") else {
            print("URL is Invalid")
            return
        }

        do {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let requestData = try JSONEncoder().encode(data)
            request.httpBody = requestData

            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                }
            }
            // Print the raw response data
               //  print("Response Body: \(String(data: responseData, encoding: .utf8) ?? "Unable to convert data to string")")

            //DispatchQueue.main.async {
              //  self.dogMatches = decodedResponse.matches
            //}
        } catch {
            print("Error during POST request: \(error)")
        }
    }
    
    func postDislike(data: Dislike) async {
        guard let url = URL(string: "https://sdv-bdx.fr/api/v1/paw/dislike") else {
            print("URL is Invalid")
            return
        }

        do {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let requestData = try JSONEncoder().encode(data)
            request.httpBody = requestData

            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                }
            }
            //print("Request Body: \(String(data: requestData, encoding: .utf8) ?? "Unable to convert data to string")")

            // Print the raw response data
              //   print("Response Body: \(String(data: responseData, encoding: .utf8) ?? "Unable to convert data to string")")

            //DispatchQueue.main.async {
              //  self.dogMatches = decodedResponse.matches
            //}
        } catch {
            print("Error during POST request: \(error)")
        }
    }
}
