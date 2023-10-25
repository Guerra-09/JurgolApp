//
//  CardComponent.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//
import Foundation
import SwiftUI

struct CardComponent2: View {

    var scale: CGFloat
    var card: Card

    var body: some View {
        
        
            
        ZStack {
            // Card Material
            Image("goldCard.png")
                .resizable()
                .scaledToFit()
                .frame(width: 410 * scale)
            
            
            VStack(spacing: 5 * scale) {
                
                ZStack {
                    
                    Group {
                        VStack(spacing: -7 * scale) {
                            //Overall
                            Text(String(card.overAll))
                                .font(.custom("CruyffSans-Bold", size: 56 * scale))
                            
                            
                            // Position
                            Text(card.position)
                                .font(.custom("CruyffSans-Medium", size: 26 * scale))
                            
                        }
                        .frame(width: 85 * scale)
                        .multilineTextAlignment(.center)
                        .padding(.trailing, 150 * scale)
                    }
                    .padding(.bottom, 230 * scale)
                    
                    
                    
                    // Player face
                    Group {
                        VStack(spacing: 0 * scale) {
                            Image("defaultFace.dds")
                                .resizable()
                                .frame(maxWidth: 200 * scale, maxHeight: 200 * scale)
                                .opacity(0.5)
                                .padding(.leading, 50 * scale)
                            
                            
                            // Name
                            Text(card.name)
                                .font(.custom("CruyffSans-Medium", size: 30 * scale))
                                .frame(width: 240 * scale)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55 * scale)
                    }
                    
                    
                    /// ->   Atributes
                    HStack(spacing: 6.5 * scale) {
                        
                        Group {
                            // Ritmo
                            Text("\(card.pace)")
                            
                            //Tiro
                            Text("\(card.shoot)")
                            
                            //Pase
                            Text("\(card.pass)")
                            
                            // Regate
                            Text("\(card.dribbling)")
                            
                            // Defensa
                            Text("\(card.defense)")
                            
                            // Physic
                            Text("\(card.physic)")
                        }
                        .frame(width: 32 * scale)
                        .multilineTextAlignment(.center)
                        .font(Font.custom("CruyffSans-Medium", size: 24 * scale))
                        .keyboardType(.numberPad)
                        
                    }
                    .padding(.leading, 1 * scale)
                    .padding(.top, 240 * scale)
                    
                }
                
                
            }
            .frame(maxWidth: 300, maxHeight: 410)
            .foregroundStyle(Color("fontColor"))
            
        }
        .frame(maxWidth: 280 * scale, maxHeight: 450 * scale)
    }
}




#Preview {
    CardComponent2(scale: 0.85, card: Card(cardType: "gold", overAll: 99, position: "DC", name: "Guerra", image: "", pace: 99, shoot: 99, pass: 99, dribbling: 99, defense: 99, physic: 99))
}


