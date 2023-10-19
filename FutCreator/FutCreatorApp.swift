//
//  FutCreatorApp.swift
//  FutCreator
//
//  Created by José Guerra on 15-10-23.
//

import SwiftUI

@main
struct FutCreatorApp: App {
    
   // @StateObject private var cardsViewModel = CardsViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Home()
                    //.environmentObject(cardsViewModel)
            }
        }
    }
}
