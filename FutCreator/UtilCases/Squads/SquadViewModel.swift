//
//  SquadViewModel.swift
//  FutCreator
//
//  Created by José Guerra on 17-10-23.
//

import Foundation

class SquadViewModel: ObservableObject {
   
    @Published var squads = [
        Squad(name: "Team 1",
              numberOfPlayers: 7,
              players: [],
              formation: CardHolder(card: nil, frame: 90, positionX: 100, positionY: 350))]
    
}
