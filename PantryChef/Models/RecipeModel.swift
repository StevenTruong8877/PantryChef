//
//  RecipeModel.swift
//  PantryChef
//
//  Created by Steven Truong on 27.05.24.
//

import Foundation

struct Recipe: Decodable {
//    var id = UUID()
    var title: String
    var source: String
    var nutrition: [String:Int]
    var totalTime: Int
}
