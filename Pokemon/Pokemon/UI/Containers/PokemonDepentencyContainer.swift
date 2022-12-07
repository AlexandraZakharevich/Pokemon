//
//  PokemonDepentencyContainer.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import UIKit

class PokemonDepentencyContainer {
    
    func makeMainViewController() -> MainViewController {
        
        let sharedMainNavigationResponder = createMainNavigationResponder()
        
        let pokemonListViewControllerFactory = {
            return self.createPokemonListViewController(navigationresponder: sharedMainNavigationResponder)
        }
        
        let pokemonViewControllerFactory = { pokemonPath in
            self.createPokemonViewController(navigationStepBackResponder: sharedMainNavigationResponder, pokemonPath: pokemonPath)
        }
        
        let mainViewController = MainViewController(navigationResponder: sharedMainNavigationResponder, pokemonListViewControllerFactory: pokemonListViewControllerFactory, pokemonViewControllerFactory: pokemonViewControllerFactory)
        
        return mainViewController
        
    }
    
    private func createMainNavigationResponder() -> MainNavigationResponder {
        return MainNavigationResponder()
    }
    
    private func createPokemonListViewController(navigationresponder: MainNavigationResponder) -> PokemonListViewController {
        let presener = createPokemonListPresenter()
        
        let pokemonListViewController = PokemonListViewController(navigationResponder: navigationresponder, presenter: presener)
        return pokemonListViewController
    }
    
    private func createPokemonListPresenter() -> PokemonListPresenter {
        let pokemonListRepository = {
            self.createPokemonListRepository()
        }
        return PokemonListPresenter(pokemonListRepository: pokemonListRepository())
    }
    
    private func createPokemonListRepository() -> PokemonListRepository {
        let pokemonListNetworking = PokemonListNetworkingManager()
        let pokemonListRemoteAPI = PokemonTestPokemonListRemoteAPI(networking: pokemonListNetworking)
        return PokemonTestPokemonListRepository(remoteAPI: pokemonListRemoteAPI)
    }
    
    private func createPokemonViewController(navigationStepBackResponder: NavigationStepBackResponder, pokemonPath: String) -> PokemonViewController {
        let presenter = createPokemonPresenter()
        let pokemonViewController = PokemonViewController(navigationStepBackResponer: navigationStepBackResponder, presenter: presenter, pokemonPath: pokemonPath)
        return pokemonViewController
    }
    
    private func createPokemonPresenter() -> PokemonPresenter {
        let pokemonRepository = {
            self.createPokemonRepository()
        }
        return PokemonPresenter(pokemonRepository: pokemonRepository())
    }
    
    private func createPokemonRepository() -> PokemonRepository {
        let pokemonNetworking = PokemonNetworkingManager()
        let pokemonRemoteAPI = PokemonTestPokemonRemoteAPI(networking: pokemonNetworking)
        return PokemonTestPokemonRepository(remoteAPI: pokemonRemoteAPI)
    }
}
