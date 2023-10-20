//
//  EditCardView.swift
//  FutCreator
//
//  Created by José Guerra on 20-10-23.
//

import Foundation
import SwiftUI

struct EditCard: View {
    
    @ObservedObject var vm: CardsViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var editable: Bool = true
    @State var overallText: String = "99"
    @State var positionText: String = "DC"
    @State var nameText: String = "Name here"
    @State var paceText: String = "99"
    @State var shootText: String = "99"
    @State var passText: String = "99"
    @State var dribblingText: String = "99"
    @State var defenseText: String = "99"
    @State var physicText: String = "99"
    
    let card: Card
    
    var body: some View {
        VStack {
            CardComponent(vm: vm, editable: $editable,
                overallText: $overallText,
                positionText: $positionText,
                nameText: $nameText,
                paceText: $paceText,
                shootText: $shootText,
                passText: $passText,
                dribblingText: $dribblingText,
                defenseText: $defenseText,
                physicText: $physicText)
            
            Button(action: {
                
                let cardEdited = Card(cardType: "gold", overAll: Int(overallText)!, position: positionText, name: nameText, image: "", pace: Int(paceText)!, shoot: Int(shootText)!, pass: Int(passText)!, dribbling: Int(dribblingText)!, defense: Int(defenseText)!, physic: Int(physicText)!)
                
                modifyCard(card: cardEdited)
                
                dismiss()
                
            }, label: {
                Text("Finish editing")
                    .font(.title)
                    .frame(width: 200, height: 70, alignment: .center)
                    .background(.blue)
                    .foregroundColor(.white)
                    .border(.black)
            })
        }
        .onAppear {
            
            overallText = String(card.overAll)
            positionText = card.position
            nameText = card.name
            paceText = String(card.pace)
            shootText = String(card.shoot)
            passText = String(card.pass)
            dribblingText = String(card.dribbling)
            defenseText = String(card.defense)
            physicText = String(card.physic)
        }
    }
    
    
//    func modifyCard(card: Card) {
//        vm.editCard(card)
//    }
    
    func modifyCard(card: Card) {
        var editedCard = card
        editedCard.overAll = Int(overallText) ?? 0
        editedCard.position = positionText
        editedCard.name = nameText
        editedCard.pace = Int(paceText) ?? 0
        editedCard.shoot = Int(shootText) ?? 0
        editedCard.pass = Int(passText) ?? 0
        editedCard.dribbling = Int(dribblingText) ?? 0
        editedCard.defense = Int(defenseText) ?? 0
        editedCard.physic = Int(physicText) ?? 0

        vm.editCard(editedCard)
        
        vm.sendChangeNotification()
    }
    
    
}
