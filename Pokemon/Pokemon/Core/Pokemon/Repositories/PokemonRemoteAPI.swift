//
//  PokemonRemoteAPI.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation
import ObjectMapper

protocol PokemonRemoteAPI {
    func getPokemon(pokemonPath: String, closer: @escaping(Result<Pokemon, Swift.Error>)->Void)
}

class Pokemon: Mappable {
    var name: String = ""
    var weight: Int = 0
    var height: Int = 0
    var sprites: Sprites?
    var types = [Types]()
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        name                  <- map["name"]
        weight                <- map["weight"]
        height                <- map["height"]
        types                 <- map["types"]
        sprites               <- map["sprites"]
    }
}

class Sprites: Mappable {
    var front_default: String = ""
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        front_default         <- map["front_default"]
    }
}

class Types: Mappable {
    var slot: Int = 0
    var type: PokemonShortInfo?
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        slot        <- map["slot"]
        type        <- map["type"]
    }
}
