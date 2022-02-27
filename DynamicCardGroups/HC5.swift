//
//  HC5.swift
//  LearnSwiftUI
//
//  Created by Vipul on 26/02/22.
//

import SwiftUI

struct HC5: View {
    
    var card: Card?
    var bgColor: Color?
    
    init(card: Card?) {
        
        self.card = card
        if let color = card?.bgColor {
            self.bgColor = Color(hex: color)
        }
    }
    
    var body: some View {
        
        HStack {
            if let imageURL = URL(string: card?.bgImage?.imageURL ?? "") {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                } placeholder: {
                    Color.gray
                }.mask(RoundedRectangle(cornerRadius: 16))
                    .onTapGesture() {
                        if let url = URL(string: card?.url ?? "") {
                            UIApplication.shared.open(url)
                        }
                    }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 8)).foregroundColor(bgColor ?? Color.white)
    }
}

//struct HC5_Previews: PreviewProvider {
//    static var previews: some View {
//        HC5()
//    }
//}

extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
