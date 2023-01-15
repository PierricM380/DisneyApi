//
//  DisneyModelView.swift
//  DisneyApi
//
//  Created by Pierric Marye on 05/01/2023.
//

import Foundation

class DisneyModelView: ObservableObject {
    @Published var characters: [Data] = []
    
    func fetchData() async {
        guard let url = URL(string: "https://api.disneyapi.dev/characters") else {
            print("URL non valide")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(DisneyModel.self, from: data) {
                characters = decodedResponse.data
            }
        } catch {
            print("Données non valides")
        }
    }
}
