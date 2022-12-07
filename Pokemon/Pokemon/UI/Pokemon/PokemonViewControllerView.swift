//
//  PokemonViewControllerView.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import UIKit

class PokemonViewControllerView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Constants.Pokemon.pokemomImageBorder
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    let pokemonTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    let pokemonWeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    let pokemonHeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .italicSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    let returnButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 2.5
        button.setTitle("Back to list", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var firstAppear = true
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if firstAppear {
            layoutElements()
            firstAppear = false
        }
    }
    
    private func layoutElements() {
        layoutScrollView()
        layoutPokemonImageView()
        layoutPokemonNameLabel()
        layoutPokemonTypeLabel()
        layoutPokemonWeightLabel()
        layoutPokemonHeightLabel()
        layoutReturnButton()
    }
    
    private func layoutScrollView() {
        addSubview(scrollView)
        scrollView.fillSuperview()
    }
    
    private func layoutPokemonImageView() {
        scrollView.addSubview(pokemonImageView)
        NSLayoutConstraint.activate([
            pokemonImageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 80),
            pokemonImageView.centerXAnchor.constraint(equalTo: scrollView.frameLayoutGuide.centerXAnchor),
            pokemonImageView.heightAnchor.constraint(equalToConstant: Constants.Pokemon.pokemomImageBorder),
            pokemonImageView.widthAnchor.constraint(equalToConstant: Constants.Pokemon.pokemomImageBorder)
        ])
    }
    
    private func layoutPokemonNameLabel() {
        scrollView.addSubview(pokemonNameLabel)
        NSLayoutConstraint.activate([
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant:  25),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: Constants.Pokemon.lateralSpacing),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -Constants.Pokemon.lateralSpacing),
            pokemonNameLabel.heightAnchor.constraint(equalToConstant: Constants.Pokemon.lateralSpacing)
        ])
    }
    
    private func layoutPokemonTypeLabel() {
        scrollView.addSubview(pokemonTypeLabel)
        NSLayoutConstraint.activate([
            pokemonTypeLabel.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: Constants.Pokemon.lateralSpacing),
            pokemonTypeLabel.heightAnchor.constraint(equalToConstant: Constants.Pokemon.defaultLabelHeight),
            pokemonTypeLabel.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: Constants.Pokemon.lateralSpacing),
            pokemonTypeLabel.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -Constants.Pokemon.lateralSpacing)
        ])
    }
    
    private func layoutPokemonWeightLabel() {
        scrollView.addSubview(pokemonWeightLabel)
        NSLayoutConstraint.activate([
            pokemonWeightLabel.topAnchor.constraint(equalTo: pokemonTypeLabel.bottomAnchor, constant: Constants.Pokemon.lateralSpacing),
            pokemonWeightLabel.heightAnchor.constraint(equalToConstant: Constants.Pokemon.defaultLabelHeight),
            pokemonWeightLabel.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: Constants.Pokemon.lateralSpacing),
            pokemonWeightLabel.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -Constants.Pokemon.lateralSpacing)
        ])
    }
    
    private func layoutPokemonHeightLabel() {
        scrollView.addSubview(pokemonHeightLabel)
        NSLayoutConstraint.activate([
            pokemonHeightLabel.topAnchor.constraint(equalTo: pokemonWeightLabel.bottomAnchor, constant: Constants.Pokemon.lateralSpacing),
            pokemonHeightLabel.heightAnchor.constraint(equalToConstant: Constants.Pokemon.defaultLabelHeight),
            pokemonHeightLabel.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: Constants.Pokemon.lateralSpacing),
            pokemonHeightLabel.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -Constants.Pokemon.lateralSpacing)
        ])
    }
    
    private func layoutReturnButton() {
        scrollView.addSubview(returnButton)
        NSLayoutConstraint.activate([
            returnButton.topAnchor.constraint(equalTo: pokemonHeightLabel.bottomAnchor, constant: Constants.Pokemon.lateralSpacing),
            returnButton.heightAnchor.constraint(equalToConstant: Constants.Pokemon.returnButtonHeight),
            returnButton.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: Constants.Pokemon.lateralSpacing),
            returnButton.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -Constants.Pokemon.lateralSpacing),
            returnButton.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -Constants.Pokemon.lateralSpacing)
        ])
    }
    
}
