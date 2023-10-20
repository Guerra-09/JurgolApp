//
//  CardComponent2.swift
//  FutCreator
//
//  Created by José Guerra on 19-10-23.
//

import Foundation
//
//  CardComponent.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import SwiftUI

struct CardComponent2: View {
    
    @ObservedObject var vm = CardsViewModel()

//    var overallText: String
//    var positionText: String
//    var nameText: String
//    var paceText: String
//    var shootText: String
//    var passText: String
//    var dribblingText: String
//    var defenseText: String
//    var physicText: String
    
    var card: Card

    
    var body: some View {
        ZStack {
            // Card Material
            Image("goldCard.png")
                .resizable()
                .scaledToFit()
                .frame(width: 410)
            
            

            
            VStack {
                
                ZStack {
                    
                    Group {
                        VStack(spacing: -7) {
                            //Overall
                            Text(String(card.overAll))
                                .font(.custom("CruyffSans-Bold", size: 56))
                            

                            // Position
                            Text(card.position)
                                .font(.custom("CruyffSans-Medium", size: 26))
                            
                        }
                        //.disabled(editable ? true : false)
                        .frame(width: 85)
                        .multilineTextAlignment(.center)
                        .padding(.trailing, 150)
                    }
                    .padding(.bottom, 230)
                        
                        
                    
                    // Player face
                    Group {
                        VStack(spacing: 0) {
                            Image("defaultFace.dds")
                                .resizable()
                                .frame(maxWidth: 200, maxHeight: 200)
                                .opacity(0.5)
                                .padding(.leading, 50)
                            
                            
                            // Name
                            Text(card.name)
                                .font(.custom("CruyffSans-Medium", size: 30))
                                .frame(width: 240)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 55)
                    }
                    
                    
                    /// ->   Atributes
                    HStack(spacing: 6.5) {
                        
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
                        .frame(width: 32)
                        .multilineTextAlignment(.center)
                        .font(Font.custom("CruyffSans-Medium", size: 24))
                        .keyboardType(.numberPad)
                        
                    }
                    .padding(.leading, 1)
                    .padding(.top, 240)
                    
                }
                
                
                }
            
            .frame(maxWidth: 300, maxHeight: 410)
            
            
        }
        .foregroundStyle(Color("fontColor"))
        
    }
}
