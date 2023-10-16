//
//  CardViewModel.swift
//  FutCreator
//
//  Created by José Guerra on 16-10-23.
//

import Foundation

class CardViewModel: ObservableObject {
    
    @Published var card: Card
    
    init() {
        self.card = Card(cardType: "gold", overAll: 99, position: "MC", name: "Guerra", image: "", pace: 99, shoot: 99, pass: 99, dribbling: 99, defense: 99, physic: 99)
    }
    
    func updateLatestChanges(cardType: String = "gold", overAll: Int, position: String, name: String, image: String = "", pace: Int, shoot: Int, pass: Int, dribbling: Int, defense: Int, physic: Int) {
        
        card.cardType = "gold"
        card.overAll = overAll
        card.position = position
        card.name = name
        card.image = ""
        card.pace = pace
        card.shoot = shoot
        card.pass = pass
        card.dribbling = dribbling
        card.defense = defense
        card.physic = physic
    }
}

