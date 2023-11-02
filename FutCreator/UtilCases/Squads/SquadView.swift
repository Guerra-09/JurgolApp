//
//  SquadView.swift
//  FutCreator
//
//  Created by José Guerra on 17-10-23.
//

import SwiftUI

struct SquadView: View {
    
    // ViewModel
    @EnvironmentObject var playersCard: CardsViewModel
    @ObservedObject var vm = SquadViewModel()
    @ObservedObject var squadvm: NewSquadViewModel = NewSquadViewModel()
    
    // For rooting
    @State private var path = [Int]()
    
    // For setting up
    @State var playersSelected = 7
    var numberOfPlayers = [5, 7, 8, 11]
    
    // Helpers
    @State var imageSize: CGFloat = 100
    @State var sheet = false
    
    
    
    var body: some View {
        
        NavigationStack(path: $path) {
        
            VStack {
                Text("No hay plantillas disponibles")
                
                NavigationLink("Crea una nueva", value: 1)
            
            }
            .navigationDestination(for: Int.self) { val in
                
                if val == 1 {
                    
                    VStack {
                        Picker("Selecciona cuantos jugadores habran en la plantilla", selection: $playersSelected) {
                            ForEach(numberOfPlayers, id: \.self) { value in
                                Text("\(value)")
                            }
                        }
                        
                        Button(action: {
                            path.append(val + 1)
                        }, label: {
                            Text("Crear una nueva")
                        })
                        
                        Text("\(val)")

                    }
                    
                    
                } else if val == 2 {
                    
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
                            path.removeAll()
                            
                        }, label: {
                            Text("Guardar plantilla")
                                .frame(width: 180, height: 40)
                                .background(.blue)
                                .foregroundStyle(.white)
                        })
                        .padding()
                        
                        
                    }
                .sheet(isPresented: $sheet, content: {
                    AddPlayerToSquadView(vm: squadvm)
                })
                }
            }
            
            
            
            
        }
        
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
    SquadView()
        .environmentObject(CardsViewModel())
}
