//
//  IngredientsView.swift
//  PantryChef
//
//  Created by Steven Truong on 15.05.24.
//

import SwiftUI

struct IngredientsView: View {
    @StateObject var ingredientsViewModel = IngredientsViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationView {
            NavigationStack {
                Divider()
                VStack {
                    Text("Zutaten")
                        .font(.largeTitle.bold())
                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 80) {
                        ForEach(ingredientsViewModel.ingredientsModel.ingredients, id: \.self) { item in
                            Text(item)
                                .onTapGesture {
                                    ingredientsViewModel.selectIngredient(item)
                                }
                        }
                    }
                }
                Divider()
                VStack {
                    Text("Ausgewählt")
                        .font(.largeTitle.bold())
                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 80) {
                        ForEach(ingredientsViewModel.selectedIngredients, id: \.self) { item in
                            Text(item)
                                .foregroundStyle(.orange)
                                .onTapGesture {
                                    ingredientsViewModel.deselectIngredient(item)
                                }
                        }
                    }
                }
                Divider()
                NavigationLink(destination: RecipeListView()) {
                    Text("Suchen")
                }
                .navigationTitle("PantryChef")
                .navigationBarTitleDisplayMode(.inline)
                
            }
            .environmentObject(ingredientsViewModel)
        }
    }
}

#Preview {
    IngredientsView()
}

