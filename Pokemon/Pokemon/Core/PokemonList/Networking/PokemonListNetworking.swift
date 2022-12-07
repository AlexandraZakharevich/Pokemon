//
//  PokemonListNetworking.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation
import Moya

enum PokemonListNetworkingAPI {
    case getPokemons
    case getNextPokemonsPage(path: String)
}

extension PokemonListNetworkingAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .getPokemons:
            return Constants.General.baseURL
        case .getNextPokemonsPage(let path):
            return URL(string: path)!
        }
    }
    
    var path: String {
        switch self {
        case .getPokemons:
            return "/api/v2/pokemon"
        case .getNextPokemonsPage:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPokemons, .getNextPokemonsPage:
            return .get
        }
    }
    var sampleData: Data {
        return Data()
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getPokemons, .getNextPokemonsPage:
            return URLEncoding.queryString
        }
    }
}

extension PokemonListNetworkingAPI: MoyaCacheable {
    var cachePolicy: MoyaCacheablePolicy {
        switch self {
        case .getPokemons, .getNextPokemonsPage:
            return .returnCacheDataElseLoad
        }
    }
}
