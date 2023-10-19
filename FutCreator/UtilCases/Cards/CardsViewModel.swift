//
//  CardViewModel.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import Foundation

class CardsViewModel: ObservableObject {
    
    // This get the daba from the databse
    @Published var cards = [Card]()
    
    
    // Creating a newCard || For CardComponent mainly
    @Published var newCard = Card(cardType: "gold", overAll: 99, position: "MD", name: "Name", image: "", pace: 99, shoot: 99, pass: 99, dribbling: 99, defense: 99, physic: 99)
    
    init() {
        
        fetchCards()
    }
    
    func fetchCards() {}
    
    func createNewCard(cardType: String = "gold", overAll: Int, position: String, name: String, image: String = "", pace: Int, shoot: Int, pass: Int, dribbling: Int, defense: Int, physic: Int) {
        newCard.cardType = "gold"
        newCard.overAll = overAll
        newCard.position = position
        newCard.name = name
        newCard.image = ""
        newCard.pace = pace
        newCard.shoot = shoot
        newCard.pass = pass
        newCard.dribbling = dribbling
        newCard.defense = defense
        newCard.physic = physic
    }
    
    
    func addCard(card: Card) {
        cards.append(Card(cardType: "gold", overAll: card.overAll, position: card.position, name: card.name, image: "", pace: card.pace, shoot: card.shoot, pass: card.pass, dribbling: card.dribbling, defense: card.defense, physic: card.physic))
    }
    
}
