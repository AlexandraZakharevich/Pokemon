//
//  PokemonListRemoteAPI.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation
import ObjectMapper

protocol PokemonListRemoteAPI {
    func getPokemons(closer: @escaping(Result<PokemonList, Swift.Error>)->Void)
    func getNextPokemonsPage(nextPage: String, closer: @escaping(Result<PokemonList, Swift.Error>)->Void )
}

class PokemonList: Mappable {
    var next: String?
    var previous: String?
    var results: [PokemonShortInfo] = []
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        next        <- map["next"]
        previous    <- map["previous"]
        results     <- map["results"]
    }
}

class PokemonShortInfo: Mappable {
    var name: String = ""
    var url: String = ""
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        name    <- map["name"]
        url     <- map["url"]
    }
}
