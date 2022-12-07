//
//  PokemonTestPokemonRemoteAPI.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation

class PokemonTestPokemonRemoteAPI: PokemonRemoteAPI {
   
    private let networking: PokemonNetworkingManager
    
    init(networking: PokemonNetworkingManager) {
        self.networking = networking
    }
    
    func getPokemon(pokemonPath: String, closer: @escaping (Result<Pokemon, Error>) -> Void) {
        networking.getPokemon(pokemonPath: pokemonPath, closer: closer)
    }
    
}
