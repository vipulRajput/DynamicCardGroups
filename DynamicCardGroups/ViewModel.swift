//
//  ViewModel.swift
//  LearnSwiftUI
//
//  Created by Vipul on 26/02/22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var cardGroupData: CardGroupData?
    
    init() {
        getCardGroupData()
    }
    
    func getCardGroupData() {
        
        if let url = URL(string: "https://run.mocky.io/v3/04a04703-5557-4c84-a127-8c55335bb3b4") {
            
            Interceptor.fetchData(url: url, type: CardGroupData.self) { [weak self] (data, error) in
                if let cardGroupData = data {
                    debugPrint(cardGroupData)
                    DispatchQueue.main.async {
                        self?.cardGroupData = cardGroupData
                    }
                } else {
                    
                }
            }
        }
    }
}
