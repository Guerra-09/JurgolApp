//
//  ContentView.swift
//  FutCreator
//
//  Created by José Guerra on 15-10-23.
//

import SwiftUI


struct CardView: View {
    
    @ObservedObject var cardViewModel: CardViewModel
    
    @State private var overallText: String = "99"
    @State private var positionText: String = "DC"
    @State private var nameText: String = "Guerra"
    @State private var paceText: String = "99"
    @State private var shootText: String = "99"
    @State private var passText: String = "99"
    @State private var dribblingText: String = "99"
    @State private var defenseText: String = "99"
    @State private var physicText: String = "99"

    
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
                            TextField("", text: $nameText)
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
                                .onAppear {
                                    paceText = "\(cardViewModel.card.pace)"
                                }
                                .onTapGesture {
                                    paceText = ""
                                }
                            
                            //Tiro
                            TextField("", text: $shootText)
                                .onAppear {
                                    shootText = "\(cardViewModel.card.shoot)"
                                }
                                .onTapGesture {
                                    shootText = ""
                                }
                        
                            //Pase
                            TextField("", text: $passText)
                                .onAppear {
                                    passText = "\(cardViewModel.card.pass)"
                                }
                                .onTapGesture {
                                    passText = ""
                                }
        
                            // Regate
                            TextField("", text: $dribblingText)
                                .onAppear {
                                    dribblingText = "\(cardViewModel.card.dribbling)"
                                }
                                .onTapGesture {
                                    dribblingText = ""
                                }
        
                            // Defensa
                            TextField("", text: $defenseText)
                                .onAppear {
                                    defenseText = "\(cardViewModel.card.defense)"
                                }
                                .onTapGesture {
                                    defenseText = ""
                                }
        
                            // Physic
                            TextField("", text: $physicText)
                                .onAppear {
                                    physicText = "\(cardViewModel.card.physic)"
                                }
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
                .onSubmit {
                    
                    print("Updateando")

                    cardViewModel.updateLatestChanges(
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
            .frame(maxWidth: 300, maxHeight: 410)
            
        }
        .foregroundStyle(Color("fontColor"))
        .background(.red)

        
    }
        
}

#Preview {
    CardView(cardViewModel: CardViewModel())
}
