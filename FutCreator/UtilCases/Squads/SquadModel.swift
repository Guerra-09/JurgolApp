//
//  SquadModel.swift
//  FutCreator
//
//  Created by José Guerra on 24-10-23.
//

import Foundation

struct Squad: Hashable, Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let numberOfPlayers: Int
    let players: [Card]
    let formation: CardHolder
}


struct CardHolder: Hashable {
    
    let id = UUID().uuidString
    var card: Card?
    let frame: CGFloat
    let positionX: CGFloat
    let positionY: CGFloat
    
}
