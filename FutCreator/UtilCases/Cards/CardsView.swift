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
                if $vm.cards.isEmpty {
                    Text("No cards created to show")
                    
                } else {
                    
                    ForEach(vm.cards, id: \.self) { item in
                        
                        NavigationLink(destination: EditCard(vm: vm, card: item)) {
                            CardComponent2(card: item)
                        }
                        

                    }
                }
            }
        
            
        }
        .onAppear(perform: {
            print("\(vm.cards.map({ $0.name })) \n")
        })
        // Navigation Properties
        .navigationTitle("Preview Cards")
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    CreateCardView(vm: vm)
                } label: {
                    Image(systemName: "plus")
                }

            }
        })
        
    }
}

#Preview {
    NavigationStack {
        CardsView()
    }
    
}
