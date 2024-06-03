//
//  IngredientsView.swift
//  PantryChef
//
//  Created by Steven Truong on 15.05.24.
//

import SwiftUI

struct IngredientsView: View {
    @ObservedObject var viewModel = IngredientsViewModel()
    
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
                        ForEach(viewModel.ingredients, id: \.self) { item in
                            Text(item)
                                .onTapGesture {
                                    viewModel.selectIngredient(item)
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
                        ForEach(viewModel.selectedIngredients, id: \.self) { item in
                            Text(item)
                                .foregroundStyle(.orange)
                                .onTapGesture {
                                    viewModel.deselectIngredient(item)
                                }
                        }
                    }
                }
                Divider()
                NavigationLink(destination: RecipeListView(selectedIngredients: viewModel.selectedIngredients)) {
                    Text("Suchen")
                    
                }
                .navigationTitle("PantryChef")
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

#Preview {
    IngredientsView()
}
