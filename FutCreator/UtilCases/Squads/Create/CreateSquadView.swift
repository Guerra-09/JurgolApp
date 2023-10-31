//
//  CreateSquadView.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import Foundation
import SwiftUI


struct NewSquadView: View {
    
    @EnvironmentObject var playersViewModel: CardsViewModel
    @ObservedObject var vm = SquadViewModel()
    
    
    var numberOfPlayers = [5, 7, 8, 11]
    @State var playersSelected = 7
    
    var body: some View {
        VStack {
            
            Picker("Selecciona cuantos jugadores habran en la plantilla", selection: $playersSelected) {
                ForEach(numberOfPlayers, id: \.self) { value in
                    Text("\(value)")
                }
            }
            
            NavigationLink(destination: SquadPlayersView(numberOfPlayers: playersSelected)) {
                Text("Go to create players")
            }
        }
        

    }
}


// A view to add players to the squad
struct SquadPlayersView: View {
    
    var numberOfPlayers: Int
    
    @State var imageSize: CGFloat = 100
    
    @State var sheet = false
    @EnvironmentObject var playersViewModel: CardsViewModel
    @ObservedObject var squadvm: NewSquadViewModel = NewSquadViewModel()
    @Environment(\.dismiss) var dismiss


    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("squadEmpty")
                        .resizable()
                        .scaledToFit()
                        
                    ForEach(squadvm.cardHolders, id: \.self) { value in
                        if value.card != nil {
                            CardComponent2(scale: 0.34, card: value.card!)
                                .position(x: value.positionX, y: value.positionY - 85)
                                .onTapGesture {
                                    sheet.toggle()
                                    squadvm.selectedCardHolder(cardHolder: value)
                                    print(value.card?.name ?? "")
                                }
                            
                        } else {
                            Image("emptyCard")
                                .resizable()
                                .scaledToFit()
                                .frame(width: value.frame)
                                .position(x: value.positionX, y: value.positionY - 85)
                                .onTapGesture {
                                    sheet.toggle()
                                    squadvm.selectedCardHolder(cardHolder: value)
                                    
                                }
                        }
                        
                    }
                }
                Button(action: {
                    
                    dismiss()
                    
                }, label: {
                    Text("Guardar plantilla")
                        .frame(width: 180, height: 40)
                        .background(.blue)
                        .foregroundStyle(.white)
                        
                })
                .padding()
                
                
            }
        }
        .sheet(isPresented: $sheet, content: {
            AddPlayerToSquadView(vm: squadvm)
        })

    }
}



// A view to select players to get into the squad
struct AddPlayerToSquadView: View {
    
    @EnvironmentObject var players: CardsViewModel
    @ObservedObject var vm: NewSquadViewModel
    @Environment(\.dismiss) var dismiss
    
    
    
    var body: some View {
        ScrollView {
            
            if players.cards.isEmpty {
                Text("There arent players registered to select")
                
            } else {
                ForEach(players.cards) { player in
                        CardComponent2(scale: 0.7, card: player)
                            .onTapGesture {
                                vm.addPlayer(newCard: player)
                                dismiss()
                            }
                    }
            }
            
            
        }
    }
    
    // Hide cards already in squad
    func hideSelectedCards() -> Void {}
    
}








#Preview {
    NavigationStack {
        //NewSquadView()
        //AddPlayerToSquadView()
            //.environmentObject(CardsViewModel())
        
        SquadPlayersView(numberOfPlayers: 7)
            .environmentObject(CardsViewModel())
    }
}

