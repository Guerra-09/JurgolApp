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
            CardHolder(card: Card(cardType: "gold", overAll: 90, position: "DFC", name: "Guerra", image: "", pace: 85, shoot: 72, pass: 81, dribbling: 79, defense: 87, physic: 80), frame: 90, positionX: 300, positionY: 350)])
    }
    
}

struct NewSquadView: View {
    
    @ObservedObject var vm = NewSquadViewModel()
    
    var body: some View {
        
        // Squad background
        Image("squadEmpty")
            .resizable()
            .frame(width: 395, height: 500)
            .background(.red)
            .overlay {
                
                ForEach(vm.cardHolders, id: \.self) { item in
                    
                    
                    if item.card != nil {
                        
                        
                        
                    } else {
                        Image("emptyCard")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90)
                            .position(x: item.positionX, y: item.positionY)
                    }
                    
    
                    
                }
                    
                    
            }
        
        
        
        PlayerVisualizer()
            .frame(maxWidth: .infinity, maxHeight: 100)
        
    }
}



struct PlayerVisualizer: View {
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(1..<10) { item in
                    Image("emptyCard")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 70)
                }
            }
        }
        .scrollIndicators(.hidden)
        
        
    }
}


#Preview {
    NavigationStack {
        NewSquadView()
    }
}
