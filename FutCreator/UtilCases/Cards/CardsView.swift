//
//  CardView.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import SwiftUI

struct CardsView: View {
    
    @EnvironmentObject var vm: CardsViewModel 
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                NavigationLink {
                    CreateCardView(vm: vm)
                } label: {
                    Text("ADD")
                        .font(.title)
                        .frame(width: 140, height: 60)
                        .background(.blue)
                        .foregroundStyle(.white)
                }
                
                
                
                if $vm.cards.isEmpty {
                    Text("No cards created to show")
                    
                } else {
                    
                    ForEach(vm.cards, id: \.self) { item in
                        
                        NavigationLink(destination: EditCard(vm: vm, card: item)) {
                            CardComponent2(scale: 1.0, card: item)
                        }
                        
                    }
                    
                }
                
            }
            .scrollIndicators(.hidden)
        
            
        }
        // NavigationStack Properties
        //.navigationTitle("Preview Cards")
        
        
    }
}

#Preview {
    NavigationView {
        CardsView()
            .environmentObject(CardsViewModel())
    }
    
}
