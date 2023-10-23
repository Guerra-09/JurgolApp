//
//  CardComponent.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import SwiftUI

struct CardComponent: View {
    
    //@ObservedObject var vm = CardsViewModel()
    @EnvironmentObject var vm: CardsViewModel
    
    @Binding var editable: Bool
    @Binding var overallText: String
    @Binding var positionText: String
    @Binding var nameText: String
    @Binding var paceText: String
    @Binding var shootText: String
    @Binding var passText: String
    @Binding var dribblingText: String
    @Binding var defenseText: String
    @Binding var physicText: String

    
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
                            TextField("", text: $overallText)
                                .font(.custom("CruyffSans-Bold", size: 56))
                                .onTapGesture {
                                    overallText = ""
                                }
                            

                            // Position
                            TextField("", text: $positionText)
                                .font(.custom("CruyffSans-Medium", size: 26))
                                .onTapGesture {
                                    positionText = ""
                                }
                            
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
                            TextField("", text: Binding(projectedValue: $nameText))
                                .font(.custom("CruyffSans-Medium", size: 30))
                                .frame(width: 240)
                                .multilineTextAlignment(.center)
                                .onTapGesture {
                                    nameText = ""
                                }
                        }
                        .padding(.bottom, 55)
                    }
                    
                    
                    /// ->   Atributes
                    HStack(spacing: 6.5) {
                        
                        Group {
                            // Ritmo
                            TextField("", text: $paceText)
                                .onTapGesture {
                                    paceText = ""
                                }
                            
                            //Tiro
                            TextField("", text: $shootText)
                                .onTapGesture {
                                    shootText = ""
                                }
                        
                            //Pase
                            TextField("", text: $passText)
                                .onTapGesture {
                                    passText = ""
                                }
        
                            // Regate
                            TextField("", text: $dribblingText)
                                .onTapGesture {
                                    dribblingText = ""
                                }
        
                            // Defensa
                            TextField("", text: $defenseText)
                                .onTapGesture {
                                    defenseText = ""
                                }
        
                            // Physic
                            TextField("", text: $physicText)
                                .onTapGesture {
                                    physicText = ""
                                }
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
        .disabled(editable ? false : true)
        .foregroundStyle(Color("fontColor"))
        
    }
}
