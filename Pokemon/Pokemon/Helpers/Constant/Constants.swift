//
//  Constants.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import Foundation

enum Constants {
    enum General {
        static let baseURL: URL = URL(string: "https://pokeapi.co")!
    }
    enum Pokemon {
        static let pokemomImageBorder: CGFloat = 150
        static let defaultLabelHeight: CGFloat = 30
        static let lateralSpacing: CGFloat = 20
        static let returnButtonHeight: CGFloat = 50
    }
}
