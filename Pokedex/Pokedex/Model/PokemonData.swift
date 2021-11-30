//
//  PokemonData.swift
//  Pokedex
//
//  Created by AMStudent on 10/20/21.
//

import Foundation

struct PokemonData: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Float
    let height: Float
    let description: String
    let attack: Float
    let defense: Float
}

//let mockData: [PokemonData] = [
//    .init(id: 0, name: "Bulbasaur", type: "poison", weight: 15, height: 80, description: "Bulbasaur is a thing that people know about", attack: 30, defense: 18),
//    .init(id: 0, name: "Karen", type: "angry person", weight: 15, height: 80, description: "no comment", attack: 30, defense: 18)
//]
