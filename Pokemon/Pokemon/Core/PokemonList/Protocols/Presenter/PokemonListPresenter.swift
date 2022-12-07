//
//  PokemonListPresenter.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

protocol PokemonListViewProtocol: AnyObject {
    func showPokemons(pokemonsList: PokemonList)
    func showNewPokemonsPage(pokemonsList: PokemonList)
    func showError(error: String)
}

protocol PokemonListPresenterProtocol {
    func getPokemons()
    func getNextPokemonsPage(nextPage: String)
}

class PokemonListPresenter: PokemonListPresenterProtocol {
    
    weak var view: PokemonListViewProtocol?
    
    private let pokemonListRepository: PokemonListRepository
    
    init(pokemonListRepository: PokemonListRepository) {
        self.pokemonListRepository = pokemonListRepository
    }
    
    func getPokemons() {
        pokemonListRepository.getPokemons { [weak self] result in
            switch result {
            case .success(let pokemonsList):
                self?.view?.showPokemons(pokemonsList: pokemonsList)
            case .failure(let error):
                self?.view?.showError(error: error.localizedDescription)
            }
        }
    }
    
    func getNextPokemonsPage(nextPage: String) {
        pokemonListRepository.getNextPokemonsPage(nextPage: nextPage) { [weak self] result in
            switch result {
            case .success(let pokemonsList):
                self?.view?.showNewPokemonsPage(pokemonsList: pokemonsList)
            case .failure(let error):
                self?.view?.showError(error: error.localizedDescription)
            }
        }
    }
    
}
