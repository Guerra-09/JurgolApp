//
//  Home.swift
//  FutCreator
//
//  Created by José Guerra on 15-10-23.
//

import SwiftUI
import UIKit

struct Home: View {
    
    @ObservedObject var cardViewModel = CardViewModel()

    let imageSize: CGSize = CGSize(width: 400, height: 480)
    @State var highresImage = UIImage()

    var body: some View {
        NavigationStack {
            VStack {
                
                CardView(cardViewModel: cardViewModel)
            
                Button {
                    saveImage()
                } label: {
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
        highresImage = cardViewModel.asImage(size: imageSize)
        
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

extension CardViewModel {
    func asImage(size: CGSize) -> UIImage {
        let controller = UIHostingController(rootView: CardView(cardViewModel: self))
            controller.view.bounds = CGRect(origin: .zero, size: size)
            let image = controller.view.asImage()
            return image
        }
}


#Preview {
    NavigationStack {
        Home()
    }
}
