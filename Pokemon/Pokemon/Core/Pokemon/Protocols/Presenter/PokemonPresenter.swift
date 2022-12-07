//
//  PokemonPresenter.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

protocol PokemonViewProtocol: AnyObject {
    func showPokemon(pokemon: Pokemon)
    func showError(error: String)
}

protocol PokemonPresenterProtocol {
    func getPokemon(pokemonPath: String)
}

class PokemonPresenter: PokemonPresenterProtocol {
    
    weak var view: PokemonViewProtocol?
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func getPokemon(pokemonPath: String) {
        pokemonRepository.getPokemon(pokemonPath: pokemonPath) { [weak self] result in
            switch result {
            case .success(let pokemon):
                self?.view?.showPokemon(pokemon: pokemon)
            case .failure(let error):
                self?.view?.showError(error: error.localizedDescription)
            }
        }
    }
}
