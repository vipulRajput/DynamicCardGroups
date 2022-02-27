//
//  DynamicCardGroups.swift
//  LearnSwiftUI
//
//  Created by Vipul on 26/02/22.
//

import SwiftUI

struct DynamicCardGroups: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationView {
                            
                if let cardGroups = viewModel.cardGroupData?.cardGroups {
            
                    GeometryReader { geometry in
                    List {
                        VStack {
                                    
                            ForEach(cardGroups) { group in
                                
                                ScrollView(.horizontal,showsIndicators: false) {
                                    HStack {
                                        switch group.designType {

                                        case .HC1:
                                            ForEach(group.cards) { card in
                                                HC1(card: card)
                                                    .frame(width: geometry.size.width - 40)
                                            }
                                            
                                        case .HC3:
                                            ForEach(group.cards) { card in
                                                HC3.init(card: card)
                                                    .frame(width: geometry.size.width - 40)
                                                    .frame(minWidth: 0, maxWidth: geometry.size.width - 40, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                                            }
                                            
                                        case .HC5:
                                            ForEach(group.cards) { card in
                                                HC5(card: card)
                                                    .frame(width: geometry.size.width - 40)
                                            }
                                            
                                        case .HC6:
                                            ForEach(group.cards) { card in
                                                HC6(card: card)
                                                    .frame(width: geometry.size.width - 40, height: 82)
                                            }
                                            
                                        case .HC9:
                                            ForEach(group.cards) { card in
                                                HC5(card: card)
                                                    .frame(height: 78)
                                            }
                                            
                                        default:
                                            EmptyView()
                                        }
                                    }
                                }.background(Color(UIColor.systemGray6))
                            }
                        }.listRowInsets(EdgeInsets())
                            .frame(minHeight: 0, maxHeight: .infinity, alignment: .center)
                            .background(Color(UIColor.systemGray6))
                    }
                    .navigationTitle(Text("Design Types"))
                    .refreshable {
                        viewModel.getCardGroupData()
                    }
                }
            }
        }
    }
}

struct DynamicCardGroups_Previews: PreviewProvider {
    static var previews: some View {
        DynamicCardGroups()
    }
}
