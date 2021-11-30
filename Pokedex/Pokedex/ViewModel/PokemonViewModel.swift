//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by AMStudent on 10/20/21.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    
    @Published var pokemon = [PokemonData]()
    let apiURL =
"https://firebasestorage.googleapis.com/v0/b/pokedex-62529.appspot.com/o/poke.json?alt=media&token=bf6d2efd-3b30-4369-a19b-be1a524d59db"
    
    init() {
        fetchPokemonData()
    }
    
    func fetchPokemonData() {
        guard let url = URL(string: apiURL) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let cleanData = data?.parseData(removeString: "null,") else { return }
            
            DispatchQueue.main.async {
                do{
                    let pokemon = try
                JSONDecoder().decode([PokemonData].self, from:
                        cleanData)
                    self.pokemon = pokemon
                } catch {
            
                    print("error msg:", error)
                }
            }
        }
        task.resume()
    }
    
    func detectBackgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemPurple
        case "electric": return .systemYellow
        case "fairy": return .systemPink
        case "normal": return .systemBrown
        case "psychic": return .systemIndigo
        default: return .systemIndigo
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?
            .replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8)
        else { return nil }
        return data
        }
    }
    

