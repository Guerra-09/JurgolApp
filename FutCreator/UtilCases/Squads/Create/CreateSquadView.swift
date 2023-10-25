//
//  CreateSquadView.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import Foundation
import SwiftUI

class NewSquadViewModel: ObservableObject {
    
    @Published var cardHolders = [CardHolder]()
    
    init() {
        createFixedPositions()
    }
    
    func createFixedPositions() -> () {
        cardHolders.append(contentsOf: [
            CardHolder(card: nil, frame: 90, positionX: 200, positionY: 430),
            CardHolder(card: nil, frame: 90, positionX: 100, positionY: 350),
            CardHolder(card: 
                        Card(cardType: "gold", overAll: 90, position: "DFC", name: "Guerra", image: "", pace: 85, shoot: 72, pass: 81, dribbling: 79, defense: 87, physic: 80), frame: 90, positionX: 300, positionY: 350)])
    }
    
}

struct NewSquadView: View {
    
    @EnvironmentObject var playersViewModel: CardsViewModel
    @ObservedObject var vm = SquadViewModel()
    

    
    @State private var sheet: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                
                Image("squadEmpty")
                               .resizable()
                               .frame(width: 395, height: 500)
                               .background(.red)
                               //.zIndex(1)
                
                ForEach($vm.squads) { squad in
                        
                    
                    
                            
                    }
                    

            }
        
        }
        .sheet(isPresented: $sheet, content: {
            AddPlayerToSquadView()
        })
        

    }
}



struct AddPlayerToSquadView: View {
    
    @EnvironmentObject var players: CardsViewModel
    
    var body: some View {
        VStack {
            
            if players.cards.isEmpty {
                Text("There arent players registered to select")
                
            } else {
                ForEach(players.cards) { player in
                        CardComponent2(scale: 0.6, card: player)
                            .onTapGesture {
                                print(player.name) 
                            }
                    }
            }
            
            
        }
    }
}



#Preview {
    NavigationStack {
        NewSquadView()
        //AddPlayerToSquadView()
            .environmentObject(CardsViewModel())
    }
}

