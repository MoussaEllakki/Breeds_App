//
//  BreedsPageManager.swift
//  BreedsApp
//
//  Created by Moussa El Lakki on 2023-12-12.
//

import Foundation


class BreedsViewModel {
    
    var breeds: [String] = []
    
    
    // Get all breeds list from the api
    func fetchDogBreeds(completion: @escaping () -> Void) {
        
        guard let url = URL(string: Constance.breedsListUrl ) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(DogsApiResponse.self, from: data)
                if response.status == "success" {
                    self.breeds = Array(response.message.keys)
                    completion()
                } else {
                    print("API request failed with status: \(response.status)")
                }
            } catch let decodingError {
                print("Error decoding data: \(decodingError)")
            }
        }.resume()
    }
}

struct DogsApiResponse: Decodable {
    var message: [String: [String]]
    var status: String
}

