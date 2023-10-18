//
//  SquadView.swift
//  FutCreator
//
//  Created by José Guerra on 17-10-23.
//

import SwiftUI

struct SquadView: View {
    
    @ObservedObject var vm = SquadViewModel()
    
    var body: some View {
        
        
        NavigationStack {
            
            
            // Here goes squads from vm
            Text("Squad...")
            
        }
        .navigationTitle("Squad creator")
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: NewSquadView()) {
                    Image(systemName: "plus")
                }
            }
        })
        
        
    }
}





#Preview {
    NavigationStack {
        
        NavigationStack {
            SquadView()
        }
    }
}
