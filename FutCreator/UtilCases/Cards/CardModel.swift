//
//  CardModel.swift
//  FutCreator
//
//  Created by José Guerra on 20-10-23.
//

import Foundation

struct Card: Hashable, Identifiable {
    
    var id: String = UUID().uuidString
    var cardType: String
    var overAll: Int
    var position: String
    var name: String
    var image: String
    var pace: Int
    var shoot: Int
    var pass: Int
    var dribbling: Int
    var defense: Int
    var physic: Int
}
