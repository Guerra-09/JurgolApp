//
//  Home.swift
//  FutCreator
//
//  Created by José Guerra on 15-10-23.
//

import SwiftUI
import UIKit

struct Home: View {
    
    @EnvironmentObject var cardsViewModel: CardsViewModel
    
    enum Tab {
        case cards, squads
    }
    
    @State private var selectedTab: Tab = .cards
    
    var body: some View {
   
       
        TabView(selection: $selectedTab, content:  {
            
            CardsView().tabItem {
                Label("Cards", systemImage: "creditcard")
            }
            .tag(1)
            
            SquadView().tabItem {
                Label("Squads", systemImage: "sportscourt")
            }
            .tag(2)
        })
     
    
      
    }
}

#Preview {
    Home()
        .environmentObject(CardsViewModel())
}
