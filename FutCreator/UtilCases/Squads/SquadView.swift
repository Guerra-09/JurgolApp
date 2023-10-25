//
//  SquadView.swift
//  FutCreator
//
//  Created by José Guerra on 17-10-23.
//

import SwiftUI

struct SquadView: View {
    
    @EnvironmentObject var playersCard: CardsViewModel
    @ObservedObject var vm = SquadViewModel()
    
    var body: some View {
        
        
        NavigationStack {
            
            NavigationLink(destination: NewSquadView()) {
                Text("ADD")
                    .font(.title)
                    .frame(width: 140, height: 60)
                    .background(.blue)
                    .foregroundStyle(.white)
            }
            
            // Here goes squads from vm
            Text("There aren't squads to show")
            
        }
        .navigationTitle("Squad creator")
        
        
        
    }
}





#Preview {
    
        
    NavigationStack {
        SquadView()
            .environmentObject(CardsViewModel())
    }
    
}
