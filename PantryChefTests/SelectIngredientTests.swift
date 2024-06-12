//
//  SelectIngredientTests.swift
//  PantryChefTests
//
//  Created by Steven Truong on 04.06.24.
//

import XCTest
@testable import PantryChef

final class SelectIngredientTests: XCTestCase {
 
     func testSuccessfulSelection() {
        // Given (Arrange)
        let ingredient = "Schokolade"
        let ingredientsViewModel = IngredientsViewModel()
        ingredientsViewModel.ingredients = ["Karotte", "Schokolade", "Haferflocken"]
        ingredientsViewModel.selectedIngredients = []

        
        // When (Act)
        ingredientsViewModel.selectIngredient(ingredient)
        
        // Then (Assert)
        XCTAssertEqual(ingredientsViewModel.ingredients, ["Karotte", "Haferflocken"])
        XCTAssertEqual(ingredientsViewModel.selectedIngredients, ["Schokolade"])
    }
}
