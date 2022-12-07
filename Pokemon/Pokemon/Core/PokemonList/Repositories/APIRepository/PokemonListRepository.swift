//
//  PokemonListRepository.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation

protocol PokemonListRepository {
    func getPokemons(closer: @escaping(Result<PokemonList, Swift.Error>)->Void)
    func getNextPokemonsPage(nextPage: String, closer: @escaping(Result<PokemonList, Swift.Error>)->Void )
}

final class PokemonTestPokemonListRepository: PokemonListRepository {

    let remoteAPI: PokemonListRemoteAPI
    
    init(remoteAPI: PokemonListRemoteAPI) {
        self.remoteAPI = remoteAPI
    }
    
    func getPokemons(closer: @escaping (Result<PokemonList, Error>) -> Void) {
        remoteAPI.getPokemons(closer: closer)
    }
    
    func getNextPokemonsPage(nextPage: String, closer: @escaping (Result<PokemonList, Error>) -> Void) {
        remoteAPI.getNextPokemonsPage(nextPage: nextPage, closer: closer)
    }
}
