//
//  PokemonNetworking.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation
import Moya

enum PokemonNetworkingAPI {
    case getPokemon(path: String)
}

extension PokemonNetworkingAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .getPokemon(let path):
            return URL(string: path)!
        }
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        switch self {
        case .getPokemon:
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
        case .getPokemon:
            return URLEncoding.queryString
        }
    }
}

extension PokemonNetworkingAPI: MoyaCacheable {
    var cachePolicy: MoyaCacheablePolicy {
        switch self {
        case .getPokemon:
            return .returnCacheDataElseLoad
        }
    }
}
