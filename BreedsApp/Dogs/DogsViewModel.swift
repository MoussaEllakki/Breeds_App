//
//  BreedListManager.swift
//  BreedsApp
//
//  Created by Moussa El Lakki on 2023-12-12.
//



import Foundation
import UIKit

class DogsViewModel {
    
    var dogs : [Dog]  = []
    
    // Get all urls images for specific breeds by breeds tittle
    func fetchdogsImageUrls(completion: @escaping () -> Void, breedTittle : String) {
        
        let specificBreedUrl = "\(Constance.startOfBreedUrl)\(breedTittle)\(Constance.EndOfBreedUrl)"
        guard let url = URL(string: specificBreedUrl) else {
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
                let dogsApi = try decoder.decode(DogsApi.self, from: data)
                let imageUrls = dogsApi.message
                
                for imageUrlString in imageUrls {
                    let dog = Dog(imageUrlString: imageUrlString, dogBreedType: "")
                    self.dogs.append(dog)
                }
                
                completion()
                
            } catch let decodingError {
                print("Error decoding data: \(decodingError)")
            }
        }.resume()
    }
}

struct Dog {
    let imageUrlString : String
    let dogBreedType : String
}

struct DogsApi: Codable {
    let message: [String]
    let status: String
}


    
    
    

