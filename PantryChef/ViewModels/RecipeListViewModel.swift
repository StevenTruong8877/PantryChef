//
//  RecipeListViewModel.swift
//  PantryChef
//
//  Created by Steven Truong on 27.05.24.
//

import Foundation
import SwiftUI

@MainActor class RecipeListViewModel: ObservableObject {
    @Published var recipeItems = [Recipe]()
    
    //    var ingredientsString = ingredients.joined(separator: "%20")
    //    var selectedIngredientsString = "Brot"
    
     func fetchData(with ingredients: [String]) async {
        let ingredientsString = ingredients.joined(separator: "%20")

        // URL
        // Create URL object with gustar-io url as endpoint
        // url could be nil -> specify error if nil
        guard let url = URL(string: "https://gustar-io-deutsche-rezepte.p.rapidapi.com/search_api?text=\(ingredientsString)") else {
            print("Fehler beim Erstellen eines url-Objekts")
            return
        }
        
        // URL Request
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        // Specify header
        let headers = ["X-RapidAPI-Key": "427f9a8402msh5f1da0aa2218fdfp1fb760jsn9b0f3fbee31c",
                       "X-RapidAPI-Host": "gustar-io-deutsche-rezepte.p.rapidapi.com"]
        
        // set header for request
        request.allHTTPHeaderFields = headers
        
        // Set request type
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let recipes = try JSONDecoder().decode([Recipe].self, from: data)
            self.recipeItems = recipes
        }
        catch {
            print(error)
        }
        
        
//                    // Get URLSession
//                    let session = URLSession.shared
//        
//                    // Create data task
//                    let dataTask = session.dataTask(with: request) { data, response, error in
//        
//                        // Check for errors
//                        if error == nil && data != nil {
//        
//                            // Try to parse out the data
//                            do {
//                                 let response = try JSONDecoder().decode([Recipe].self, from: data!)
//                                self.recipeItems = response
//                            }
//                            catch {
//                                print(error)
//                            }
//                        }
//                    }
//        
//                    // Start data task
//                    dataTask.resume()
        
    }
}
