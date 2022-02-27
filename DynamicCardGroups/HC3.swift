//
//  HC3.swift
//  LearnSwiftUI
//
//  Created by Vipul on 25/02/22.
//

import SwiftUI

struct HC3: View {
    
    var card: Card?
    var bgColor: Color = .blue
    
    init(card: Card?) {
        
        self.card = card
        if let color = card?.bgColor {
            self.bgColor = Color(hex: color)
        }
    }
    
    var body: some View {
        
        ZStack {
            
            if let imageURL = URL(string: card?.bgImage?.imageURL ?? "") {
                
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    bgColor
                }
            }
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text(card?.title ?? "")
                    .font(.system(size: 32))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.top, 150)
                
                Text(card?.cardDescription ?? "")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.bottom, 24)
                
                Button(card?.cta?.first?.text ?? "") {
                    if let url = URL(string: card?.cta?.first?.url ?? "") {
                        UIApplication.shared.open(url)
                    }
                }
                .font(.system(size: 20, weight: .medium))
                .frame(width: 200, height: 50)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.black))
                .foregroundColor(.white)
                .padding(.bottom, 24)
                
            }.padding(.leading)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }.background(RoundedRectangle(cornerRadius: 8).foregroundColor(bgColor))
    }
}

//struct HC3_Previews: PreviewProvider {
//    static var previews: some View {
//        HC3()
//    }
//}
