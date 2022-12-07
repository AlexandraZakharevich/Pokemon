//
//  PokemonRepository.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation

protocol PokemonRepository {
    func getPokemon(pokemonPath: String, closer: @escaping(Result<Pokemon, Swift.Error>)->Void)
}

final class PokemonTestPokemonRepository: PokemonRepository {
   
    let remoteAPI: PokemonRemoteAPI
    
    init(remoteAPI: PokemonRemoteAPI) {
        self.remoteAPI = remoteAPI
    }
    
    func getPokemon(pokemonPath: String, closer: @escaping (Result<Pokemon, Error>) -> Void) {
        remoteAPI.getPokemon(pokemonPath: pokemonPath,closer: closer)
    }
    
   
}
