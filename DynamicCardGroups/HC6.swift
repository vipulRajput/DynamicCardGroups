//
//  HC6.swift
//  LearnSwiftUI
//
//  Created by Vipul on 26/02/22.
//

import SwiftUI

struct HC6: View {
    
    var card: Card?
    
    var body: some View {
        
        HStack {
            
            if let imageURL = URL(string: card?.icon?.imageURL ?? "") {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding()
                } placeholder: {
                    Color.gray
                }.mask(RoundedRectangle(cornerRadius: 16))
            }
            
            Text(card?.title ?? "")
                .font(.system(size: 16))
                .foregroundColor(.black)
            
            Spacer()
            
            Text(">")
                .font(.system(size: 24))
                .foregroundColor(.black)
                .frame(width: 30, height: 30, alignment: .center)
                .padding(.trailing, 16)
            
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 8)).foregroundColor(.white)
        .onTapGesture() {
            if let url = URL(string: card?.url ?? "") {
                UIApplication.shared.open(url)
            }
        }
    }
}

struct HC6_Previews: PreviewProvider {
    static var previews: some View {
        HC6()
    }
}
