//
//  PokemonNetworkingManager.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation
import Moya
import Moya_ObjectMapper

class PokemonNetworkingManager {
    
    private let provider = MoyaProvider<PokemonNetworkingAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getPokemon(pokemonPath: String, closer: @escaping (Result<Pokemon, Error>) -> Void) {
        provider.request(.getPokemon(path: pokemonPath)) { result in
            switch result {
            case .success(let responce):
                guard let result = try? responce.mapObject(Pokemon.self) else { return }
                closer(.success(result))
            case .failure(let error):
                closer(.failure(error))
            }
        }
    }
    
}
