//
//  PokemonViewController.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import UIKit

class PokemonViewController: NiblessViewController {
    
    var contentView: PokemonViewControllerView {
        view as! PokemonViewControllerView
    }
    
    private let navigationStepBackResponer: NavigationStepBackResponder
    private let presenter: PokemonPresenter
    private let pokemonPath: String
    
    init(navigationStepBackResponer: NavigationStepBackResponder, presenter: PokemonPresenter, pokemonPath: String) {
        self.navigationStepBackResponer = navigationStepBackResponer
        self.presenter = presenter
        self.pokemonPath = pokemonPath
        super.init()
    }
    
    override func loadView() {
        super.loadView()
        view = PokemonViewControllerView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        addTargets()
        presenter.getPokemon(pokemonPath: pokemonPath)
    }
    
    private func addTargets() {
        contentView.returnButton.addTarget(self, action: #selector(returnButtonWasPressed), for: .touchUpInside)
    }
    
    private func showErrorMessage(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.navigationStepBackResponer.handleStepBack()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    private func setupPokemon(pokemon: Pokemon) {
        setupPokemonImage(stringUrl: pokemon.sprites?.front_default)
        setupPokemonLabels(pokemon: pokemon)
    }
    
    private func setupPokemonImage(stringUrl: String?) {
        contentView.pokemonImageView.load(url: stringUrl)
    }
    
    private func setupPokemonLabels(pokemon: Pokemon) {
        guard let type = pokemon.types.first?.type?.name else { return }
        let name = pokemon.name
        let weight = pokemon.weight
        let height = pokemon.height
        
        contentView.pokemonNameLabel.text = "Name: \(name)"
        contentView.pokemonTypeLabel.text = "Type: \(type)"
        contentView.pokemonWeightLabel.text = "Weight: \(weight) kg"
        contentView.pokemonHeightLabel.text = "Height: \(height) cm"
    }
}

extension PokemonViewController: PokemonViewProtocol {
    func showPokemon(pokemon: Pokemon) {
        self.setupPokemon(pokemon: pokemon)
    }
    
    func showError(error: String) {
        showErrorMessage(error: error)
    }
}
//MARK: - OBJC Methods
extension PokemonViewController {
    @objc private func returnButtonWasPressed() {
        navigationStepBackResponer.handleStepBack()
    }
}
