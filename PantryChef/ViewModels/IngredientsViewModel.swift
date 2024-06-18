//
//  IngredientsViewModel.swift
//  PantryChef
//
//  Created by Steven Truong on 15.05.24.
//

import Foundation
import SwiftUI

 class IngredientsViewModel: ObservableObject {
    @Published var ingredientsModel = IngredientsModel()
    @Published var selectedIngredients: [String] = []
    
     
    func selectIngredient(_ ingredient : String) {
        selectedIngredients.append(ingredient)
        ingredientsModel.ingredients.removeAll { $0 == ingredient }
    }
    
    func deselectIngredient(_ ingredient : String) {
        ingredientsModel.ingredients.append(ingredient)
        selectedIngredients.removeAll { $0 == ingredient }
    }
    
}
