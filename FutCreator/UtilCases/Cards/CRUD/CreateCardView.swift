//
//  CardView.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import SwiftUI
import UIKit

struct CreateCardView: View {
    
    @ObservedObject var vm: CardsViewModel
    @Environment(\.dismiss) var dismiss
    
    let imageSize: CGSize = CGSize(width: 400, height: 480)
    @State var highresImage = UIImage()
    
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

    
    var body: some View {
        NavigationStack {
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
                    
                    let cardCreated = Card(cardType: "gold", overAll: Int(overallText)!, position: positionText,name: nameText,image: "", pace: Int(paceText)!, shoot: Int(shootText)!, pass: Int(passText)!, dribbling: Int(dribblingText)!, defense: Int(defenseText)!, physic: Int(physicText)!)
                    
                    vm.addCard(cardCreated)
                    
                    dismiss()
                    
                }) {
                    Text("Save card")
                        .font(.title)
                        .frame(width: 200, height: 70, alignment: .center)
                        .background(.blue)
                        .foregroundColor(.white)
                        .border(.black)
                }
            }
        }
        
    }
    // Save on camera roll
    func saveImage() {
        //highresImage = cardViewModel.asImage(size: imageSize)
        UIImageWriteToSavedPhotosAlbum(highresImage, nil, nil, nil)
    }
}

// Screenshot
extension UIView {
    func asImage() -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = 2.0
        return UIGraphicsImageRenderer(size: self.layer.frame.size, format: format).image { context in
            self.drawHierarchy(in: self.layer.bounds, afterScreenUpdates: true)
        }
    }
}

extension View {
    func asImage(size: CGSize) -> UIImage {
        let controller = UIHostingController(rootView: self)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        let image = controller.view.asImage()
        return image
    }
}


