//
//  MainNavigationResponder.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation

class MainNavigationResponder {
    var mainView: Dynamic<MainView?> = Dynamic(nil)
    var stepBack: Dynamic<Void> = Dynamic(Void())
}

extension MainNavigationResponder: MainResponder {
    func navigateToPokemon(pokemonPath: String) {
        mainView.value = .pokemon(path: pokemonPath)
    }
}

extension MainNavigationResponder: NavigationStepBackResponder {
    func handleStepBack() {
        stepBack.value = Void()
    }
}

protocol MainResponder {
    func navigateToPokemon(pokemonPath: String)
}
