//
//  PokenonTestPokemonListRemoteAPI.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation

class PokemonTestPokemonListRemoteAPI: PokemonListRemoteAPI {
    
    private let networking: PokemonListNetworkingManager
    
    init(networking: PokemonListNetworkingManager) {
        self.networking = networking
    }
    
    func getPokemons(closer: @escaping (Result<PokemonList, Error>) -> Void) {
        networking.getPokemons(closer: closer)
    }
    
    func getNextPokemonsPage(nextPage: String, closer: @escaping (Result<PokemonList, Error>) -> Void) {
        networking.getNextPokemonsPage(nextPage: nextPage, closer: closer)
    }
}
