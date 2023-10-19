//
//  CardView.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import SwiftUI

struct CardsView: View {
    
    @ObservedObject var vm: CardsViewModel = CardsViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView() {
                if vm.cards.isEmpty {
                    Text("No cards created to show")
                    
                } else {
                    
                    ForEach(vm.cards, id: \.self) { item in
                        
                        NavigationLink(destination: EditCard(card: item)) {
                            
                            CardComponent(editable: false, overallText: "99", positionText: "MC", nameText: item.name, paceText: "99", shootText: "99", passText: "99", dribblingText: "99", defenseText: "99", physicText: "99")
                            
                        }
                        
                        
                    }
                }
            }
            
        }
        
        
        // Navigation Properties
        .navigationTitle("Preview Cards")
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    CreateCardView(parentChild: vm)
                } label: {
                    Image(systemName: "plus")
                }

            }
        })
        
    }
}

struct EditCard: View {
    let card: Card
    
    var body: some View {
        VStack {
            CardComponent(
                editable: false,
                overallText: "\(card.overAll)",
                positionText: "\(card.position)",
                nameText: card.name,
                paceText: "\(card.pace)",
                shootText: "\(card.shoot)",
                passText: "\(card.pass)",
                dribblingText: "\(card.dribbling)",
                defenseText: "\(card.defense)",
                physicText: "\(card.physic)"
            )
        }
    }
}

#Preview {
    NavigationStack {
        CardsView()
    }
    
}
