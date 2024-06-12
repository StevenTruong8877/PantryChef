//
//  DeselectIngredientTests.swift
//  PantryChefTests
//
//  Created by Steven Truong on 12.06.24.
//

import XCTest
@testable import PantryChef

final class DeselectIngredientTests: XCTestCase {
 
     func testSuccessfulDeselection() {
        // Given (Arrange)
        let ingredient = "Haferflocken"
        let ingredientsViewModel = IngredientsViewModel()
        ingredientsViewModel.ingredients = []
        ingredientsViewModel.selectedIngredients = ["Karotte", "Schokolade", "Haferflocken"]

         
        // When (Act)
        ingredientsViewModel.deselectIngredient(ingredient)
        
        // Then (Assert)
        XCTAssertEqual(ingredientsViewModel.ingredients, ["Haferflocken"])
        XCTAssertEqual(ingredientsViewModel.selectedIngredients, ["Karotte", "Schokolade"])
    }
}
