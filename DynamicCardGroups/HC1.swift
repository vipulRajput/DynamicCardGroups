//
//  HC1.swift
//  LearnSwiftUI
//
//  Created by Vipul on 26/02/22.
//

import SwiftUI

struct HC1: View {
    
    var card: Card?
    var bgColor: Color = Color.white
    
    init(card: Card?) {
        self.card = card
        if let color = card?.bgColor {
            self.bgColor = Color.init(hex: color)
        }
    }
    
    var body: some View {
        
        HStack {
        
            if let imageURL = URL(string: card?.icon?.imageURL ?? "") {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .background(Circle().foregroundColor(.black))
                        .padding(12)
                } placeholder: {
                    Color.gray
                }
            }
                
            VStack(alignment: .leading) {
             
                Text(card?.title ?? "")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Text(card?.name ?? "")
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
            }
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(self.bgColor))
        .onTapGesture() {
            if let url = URL(string: card?.url ?? "") {
                UIApplication.shared.open(url)
            }
        }
    }
}

//struct HC1_Previews: PreviewProvider {
//    static var previews: some View {
//        HC1().previewLayout(.fixed(width: 500, height: 150))
//    }
//}
