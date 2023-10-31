//
//  CreateSquadViewModel.swift
//  FutCreator
//
//  Created by José Guerra on 31-10-23.
//

import Foundation

class NewSquadViewModel: ObservableObject {
    
    @Published var cardHolders = [CardHolder]()
    
    var holderToChange: CardHolder? = nil
    
    init() {
        createFixedPositions()
    }
    
    func createFixedPositions() -> () {
        cardHolders.append(contentsOf: [
            CardHolder(card: nil, frame: 90, positionX: 200, positionY: 470),
            CardHolder(card: nil, frame: 90, positionX: 80, positionY: 450),
            CardHolder(card: nil, frame: 90, positionX: 320, positionY: 450),
            CardHolder(card: nil, frame: 90, positionX: 200, positionY: 600),
            CardHolder(card: nil, frame: 90, positionX: 120, positionY: 300),
            CardHolder(card: nil, frame: 90, positionX: 280, positionY: 300),
            CardHolder(card: nil, frame: 90, positionX: 200, positionY: 180)])
    }
    
    func selectedCardHolder(cardHolder: CardHolder) {
        holderToChange = cardHolder
    }
    
    func addPlayer(newCard: Card) {
        if let selectedHolder = holderToChange {
            guard let index = cardHolders.firstIndex(where: { $0.id == selectedHolder.id }) else { return }
            var updatedHolder = cardHolders[index]
            updatedHolder.card = newCard
            cardHolders[index] = updatedHolder
        }
    }
    
    
    
    
}
