//
//  MainViewController.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import UIKit

class MainViewController: NiblessViewController {
    
    let navigationResponder: MainNavigationResponder
    
    private let pokemonListViewControllerFactory: () -> PokemonListViewController
    private let pokemonViewControllerFactory: (String) -> PokemonViewController
    
    init(navigationResponder: MainNavigationResponder,
         pokemonListViewControllerFactory: @escaping () -> PokemonListViewController,
         pokemonViewControllerFactory: @escaping (String) -> PokemonViewController) {
        self.navigationResponder = navigationResponder
        self.pokemonListViewControllerFactory = pokemonListViewControllerFactory
        self.pokemonViewControllerFactory = pokemonViewControllerFactory
        super.init()
    }
    
    private let currentNavigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        return navigationController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindNavigationResponder()
        presentPokemonListViewController()
    }
    
    private func bindNavigationResponder() {
        navigationResponder.mainView.bind { [weak self] mainView in
            guard let mainView else { return }
            self?.present(mainView)
        }
        
        navigationResponder.stepBack.bind { [weak self] _ in
            self?.currentNavigationController.popViewController(animated: true)
        }
    }
    
    private func present(_ view: MainView) {
        switch view {
        case .pokemon(let path):
            presentPokemonViewController(pokemonPath: path)
        }
    }
    
    private func presentPokemonListViewController() {
        let vcToPresent = pokemonListViewControllerFactory()
        currentNavigationController.viewControllers = [vcToPresent]
        addFullScreen(childViewController: currentNavigationController)
    }
    
    private func presentPokemonViewController(pokemonPath: String) {
        let vcToPresent = pokemonViewControllerFactory(pokemonPath)
        currentNavigationController.pushViewController(vcToPresent, animated: true)
    }
}
