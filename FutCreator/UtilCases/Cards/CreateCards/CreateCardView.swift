//
//  CardView.swift
//  FutCreator
//
//  Created by José Guerra on 18-10-23.
//

import SwiftUI
import UIKit

struct CreateCardView: View {

    let imageSize: CGSize = CGSize(width: 400, height: 480)
    @State var highresImage = UIImage()

    var body: some View {
        NavigationStack {
            VStack {
                
                CardComponent(
                    overallText: "90",
                    positionText: "MC",
                    nameText: "Guerra",
                    paceText: "90",
                    shootText: "90",
                    passText: "90",
                    dribblingText: "90",
                    defenseText: "90",
                    physicText: "90")
            
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



#Preview {
    NavigationStack {
        CreateCardView()
    }
}
