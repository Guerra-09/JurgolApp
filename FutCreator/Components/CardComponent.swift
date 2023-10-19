//
//  CardComponent.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import SwiftUI

struct CardComponent: View {
    
    @ObservedObject var vm = CardsViewModel()
    
    @State var editable: Bool
    @State var overallText: String
    @State var positionText: String
    @State var nameText: String
    @State var paceText: String
    @State var shootText: String
    @State var passText: String
    @State var dribblingText: String
    @State var defenseText: String
    @State var physicText: String

    
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
                            TextField("", text: $overallText, onEditingChanged: { isEditing in
                                if !isEditing {
                                    updateCardInViewModel()
                                }
                                
                            })
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
                            TextField("", text: $nameText, onEditingChanged: { isEditing in
                                if !isEditing {
                                    updateCardInViewModel()
                                }
                            })
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
    func updateCardInViewModel() {
        vm.createNewCard(
            overAll: Int(overallText) ?? 0,
            position: positionText,
            name: nameText,
            pace: Int(paceText) ?? 0,
            shoot: Int(shootText) ?? 0,
            pass: Int(passText) ?? 0,
            dribbling: Int(dribblingText) ?? 0,
            defense: Int(defenseText) ?? 0,
            physic: Int(physicText) ?? 0
        )
    }

    
}

#Preview {
    CardComponent(editable: true, overallText: "90", positionText: "DFC", nameText: "Guerra", paceText: "90", shootText: "90", passText: "90", dribblingText: "90", defenseText: "90", physicText: "90")
}
