//
//  PokemonListNetworkingManager.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation
import Moya
import Moya_ObjectMapper

class PokemonListNetworkingManager {
    
    private let provider = MoyaProvider<PokemonListNetworkingAPI>(plugins: [NetworkLoggerPlugin(), MoyaCacheablePlugin()])
    
    func getPokemons(closer: @escaping (Result<PokemonList, Error>) -> Void) {
        provider.request(.getPokemons) { result in
            switch result {
            case .success(let responce):
                guard let result = try? responce.mapObject(PokemonList.self) else { return }
                closer(.success(result))
            case .failure(let error):
                closer(.failure(error))
            }
        }
    }
    
    func getNextPokemonsPage(nextPage: String, closer: @escaping (Result<PokemonList, Error>) -> Void) {
        provider.request(.getNextPokemonsPage(path: nextPage)) { result in
            switch result {
            case .success(let responce):
                guard let result = try? responce.mapObject(PokemonList.self) else { return }
                closer(.success(result))
            case .failure(let error):
                closer(.failure(error))
            }
        }
    }
}
