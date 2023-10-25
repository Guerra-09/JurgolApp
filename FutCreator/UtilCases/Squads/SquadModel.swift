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
