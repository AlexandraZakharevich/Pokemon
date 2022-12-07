//
//  PokemonListViewController.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import UIKit

class PokemonListViewController: NiblessViewController {
    
    var contentView: PokemonListViewControllerView {
        view as! PokemonListViewControllerView
    }
    
    private let navigationResponder: MainNavigationResponder
    private let presenter: PokemonListPresenter
    
//    MARK: - setup tableView from API
    private var lastPokemonList: PokemonList?
    private var pagginationHasStarted = false
    private var pokemonShortsInfo = [PokemonShortInfo]()
    
    init(navigationResponder: MainNavigationResponder, presenter: PokemonListPresenter) {
        self.navigationResponder = navigationResponder
        self.presenter = presenter
        super.init()
    }
    
    override func loadView() {
        super.loadView()
        view = PokemonListViewControllerView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.getPokemons()
        setupDelegates()
    }
    
    private func setupDelegates() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
    private func showErrorMessage(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
}

extension PokemonListViewController: PokemonListViewProtocol {
    func showPokemons(pokemonsList: PokemonList) {
        self.lastPokemonList = pokemonsList
        self.pokemonShortsInfo += pokemonsList.results
        contentView.tableView.reloadData()
    }
    
    func showNewPokemonsPage(pokemonsList: PokemonList) {
        self.lastPokemonList = pokemonsList
        self.pokemonShortsInfo += pokemonsList.results
        self.pagginationHasStarted = false
        contentView.tableView.reloadData()
    }
    
    func showError(error: String) {
        showErrorMessage(error: error)
    }
}

extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonShortsInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonTableViewCell.self), for: indexPath)
        guard let pokemonCell = cell as? PokemonTableViewCell else { return cell }
        pokemonCell.setupCell(name: pokemonShortsInfo[indexPath.row].name)
        return pokemonCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationResponder.navigateToPokemon(pokemonPath: pokemonShortsInfo[indexPath.row].url)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let uploadNewPageSpace: CGFloat = 150
        let uploadContentValue = scrollView.contentOffset.y + contentView.frame.height + uploadNewPageSpace
        if uploadContentValue > scrollView.contentSize.height, !pagginationHasStarted {
            guard let next = lastPokemonList?.next else { return }
            self.pagginationHasStarted = true
            presenter.getNextPokemonsPage(nextPage: next)
        }
      
        
    }
}
