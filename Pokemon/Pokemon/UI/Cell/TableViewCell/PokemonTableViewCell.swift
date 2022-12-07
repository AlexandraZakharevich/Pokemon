//
//  PokemonTableViewCell.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pokemon Name"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        layoutPokemonNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonNameLabel.text = "Pokemon Name"
    }
    
    func setupCell(name: String) {
        self.pokemonNameLabel.text = name
    }
    
    private func layoutPokemonNameLabel() {
        contentView.addSubview(pokemonNameLabel)
        NSLayoutConstraint.activate([
            pokemonNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            pokemonNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
}
