//
//  CardViewModel.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import Foundation
import Combine

class CardsViewModel: ObservableObject {
    
    @Published var cards: [Card] = []
    
    @Published var card = Card(cardType: "gold", overAll: 0, position: "MD", name: "New Name", image: "", pace: 1, shoot: 1, pass: 1, dribbling: 1, defense: 1, physic: 1)
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        
    }
    
    
    
    func addCard(_ newCard: Card) {
        cards.append(newCard)
    }
    
    func editCard(_ editedCard: Card) {
        
        if let index = cards.firstIndex(where: { $0.id == editedCard.id }) {
            cards[index] = editedCard
        }
    }
    
    func sendChangeNotification() {
            objectWillChange.send()
        }
}
