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
        testData()
    }
    
    func testData() {
        cards.append(contentsOf: [Card(cardType: "gold", overAll: 99, position: "DC", name: "Guerra", image: "", pace: 99, shoot: 99, pass: 99, dribbling: 99, defense: 99, physic: 99), Card(cardType: "gold", overAll: 99, position: "DC", name: "Baljeet", image: "", pace: 99, shoot: 99, pass: 99, dribbling: 99, defense: 99, physic: 99)])
    }
    
    
    func addCard(_ newCard: Card) {
        cards.append(newCard)
        print("Carta agregada")
        print("nueva lista: \(cards.map({ $0.name }))")
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
