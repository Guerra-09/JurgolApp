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
        print("INICIALIZANDO VIEWMODEL")
    }

    
    
    func addCard(_ newCard: Card) {
        cards.append(newCard)
    }
    
    func editCard(_ editedCard: Card) {
        
        if let index = cards.firstIndex(where: { $0.id == editedCard.id }) {
            cards[index] = editedCard // Actualiza la tarjeta existente en lugar de eliminar e insertar
            objectWillChange.send()
        }
    }
    
    func deleteCard(_ cardToDelete: String) -> Void {
        
        if let index = self.cards.firstIndex(where: { $0.id == cardToDelete }) {
            self.cards.remove(at: index)
            print("Existe la carta")
        } else {
            print("No existe la carta")
        }
    }
    
    
}
