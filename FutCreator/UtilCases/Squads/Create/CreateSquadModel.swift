//
//  CreateSquadModel.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import Foundation
import SwiftUI

struct CardHolder: Hashable {
    
    let card: Card?
    let frame: CGFloat
    let positionX: CGFloat
    let positionY: CGFloat
    
}


struct Squad: Hashable, Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let numberOfPlayers: Int
    let players: [Card]
    let formation: [CardHolder]
}


