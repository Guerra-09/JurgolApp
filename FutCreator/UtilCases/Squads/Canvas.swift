//
//  SwiftUIView.swift
//  FutCreator
//
//  Created by José Guerra on 22-10-23.
//

import SwiftUI

struct Holder: Identifiable, Hashable {
    
    let id: String = UUID().uuidString
    let name: String
    let image: String
    let card: Card?
    
    init(name: String, image: String = "emptyCard", card: Card? = nil) {
        self.name = name
        self.image = image
        self.card = card
   }
}


struct ContentView: View {
    
    @State var holder: [Holder] = [Holder(name: "prueba1")]
    
    var body: some View {
        
        VStack {
            
            ForEach(holder) { value in
                Image(value.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
            
            
            CardComponent(editable: .constant(false), overallText: .constant("99"), positionText: .constant("MC"), nameText: .constant("Guerra"), paceText: .constant("99"), shootText: .constant("99"), passText: .constant("99"), dribblingText: .constant("99"), defenseText: .constant("99"), physicText: .constant("99"))
                
        }
        
        
    }
}

#Preview {
    ContentView()
}
