//
//  IngredientsViewModel.swift
//  PantryChef
//
//  Created by Steven Truong on 15.05.24.
//

import Foundation

 class IngredientsViewModel: ObservableObject {
    @Published var ingredients: [String] = ["Tomate", "Zwiebel", "Eier", "Kartoffel", "Milch", "Hackfleisch", "Käse", "Sahne", "Reis", "Butter", "Brot", "Nudeln"]
    @Published var selectedIngredients: [String] = []
    
    
    func selectIngredient(_ ingredient : String) {
        selectedIngredients.append(ingredient)
        ingredients.removeAll { $0 == ingredient }
    }
    
    func deselectIngredient(_ ingredient : String) {
        ingredients.append(ingredient)
        selectedIngredients.removeAll { $0 == ingredient }
    }
    
}
