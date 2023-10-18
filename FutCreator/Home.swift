//
//  Home.swift
//  FutCreator
//
//  Created by José Guerra on 15-10-23.
//

import SwiftUI
import UIKit

struct Home: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                
                TabView {
                    
                    CardView()
                        .tabItem {
                            Image(systemName: "creditcard")
                                .frame(width: 20, height: 30)
                            Text("Cards")
                        }
                    
                    
                    SquadView()
                        .tabItem {
                            Image(systemName: "sportscourt")
                            Text("Squads")
                        }
                    
                }
                
            }
        }
        
    }

}





#Preview {
    NavigationStack {
        Home()
    }
}
