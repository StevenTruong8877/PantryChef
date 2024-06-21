//
//  RecipeListView.swift
//  PantryChef
//
//  Created by Steven Truong on 27.05.24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject var recipeListViewModel = RecipeListViewModel()
    @EnvironmentObject var ingredientsViewModel: IngredientsViewModel

    var body: some View {
        NavigationView {
            List(recipeListViewModel.recipeItems, id: \.title) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.source)
                        .font(.subheadline)
                    Text("\(item.totalTime)")
                }
            }
            .navigationTitle("Rezepte")
            .task  {
                await recipeListViewModel.fetchData(with: ingredientsViewModel.selectedIngredients)
                
            }
        }
    }
}

//struct RecipeListView: View {
//    @EnvironmentObject var ingredientsViewModel: IngredientsViewModel
//    var body: some View {
//        Text("Folgende Zutaten wurden ausgewählt: \n \(ingredientsViewModel.selectedIngredients)")
//    }
//}

//#Preview {
//    RecipeListView()
//}
