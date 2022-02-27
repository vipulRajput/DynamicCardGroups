//
//  Interceptor.swift
//  LearnSwiftUI
//
//  Created by Vipul on 26/02/22.
//

import Foundation

class Interceptor {
    
    static func fetchData<T: Codable>(url: URL, type: T.Type, completion: @escaping (T?, Error?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _data = data {
                
                do {
                    let parsedData = try JSONDecoder().decode(type, from: _data)
                    completion(parsedData, nil)
                } catch let error {
                    debugPrint(error)
                    completion(nil, error)
                }
            } else {
                completion(nil, nil)
            }
        }.resume()
    }
}

//{
//    NavigationView {
//        
//        GeometryReader { geometry in
//            
//            List {
//                
//                BigView().listRowInsets(EdgeInsets())
//                
//                HC6()
//                    .listRowInsets(EdgeInsets())
//                    .padding(.top, 20)
//                
//                HC5()
//                    .listRowInsets(EdgeInsets())
//                    .padding(.top, 20)
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                
//                ScrollView(.horizontal, content: {
//                    HStack(spacing: 20) {
//                        
//                        BigView().frame(width: abs(geometry.size.width - 40))
//                        BigView().frame(width: abs(geometry.size.width - 40))
//                        BigView().frame(width: abs(geometry.size.width - 40))
//                        BigView().frame(width: abs(geometry.size.width - 40))
//                    }
//                }).listRowInsets(EdgeInsets())
//                    .padding(.top, 20)
//                
//                HC1()
//                    .listRowInsets(EdgeInsets())
//                    .padding(.top, 20)
//            }
//            .navigationTitle(Text("NBA Finalists"))
//            .onAppear {
//                
//                viewModel.getWeatherData()
//            }
//        }
//    }
//}





//
//switch cardGroup.designType {
//    
//case .HC1:
//    
////                                if cardGroup.isScrollable {
//        ScrollView(.horizontal, content: {
//            HStack(spacing: 20) {
//                
//                ForEach(cardGroup.cards) { card in
//                    HC1()
//                }
//            }
//        }).listRowInsets(EdgeInsets())
//            .padding(.top, 20)
//    
//case .HC3:
//    BigView().listRowInsets(EdgeInsets())
//        .padding(.top, 20)
//    
//case .HC5:
//    
//    ScrollView(.horizontal, content: {
//        HStack(spacing: 20) {
//            
//            ForEach(cardGroup.cards) { card in
//                HC5().frame(minWidth: 0, maxWidth: .infinity)
//            }
//        }
//    }).listRowInsets(EdgeInsets())
//        .padding(.top, 20)
//    
//case .HC6:
//    HC6()
//        .listRowInsets(EdgeInsets())
//        .padding(.top, 20)
//    
//case .HC9:
//    ScrollView(.horizontal, content: {
//        HStack(spacing: 20) {
//            
//            ForEach(cardGroup.cards) { card in
//                HC5().frame(minWidth: 0, maxWidth: .infinity, idealHeight: 78)
//            }
//        }
//    }).listRowInsets(EdgeInsets())
//        .padding(.top, 20)
//    
//default:
//    EmptyView()
//}
