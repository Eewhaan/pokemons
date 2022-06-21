//
//  PokemonDetailCell.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import UIKit

class PokemonDetailFirstCell: UITableViewCell {

    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pokemonImageView.layer.cornerRadius = 45
        pokemonImageView.clipsToBounds = true
        pokemonImageView.layer.backgroundColor = UIColor.secondarySystemBackground.cgColor
        pokemonImageView.layer.borderColor = UIColor.systemCyan.cgColor
        pokemonImageView.layer.borderWidth = 2
    }
    
    func configureAvatar(pokemon detail: PokemonDetail) {
        if let url = URL(string: detail.sprites.front_default) {
            pokemonImageView.load(url: url)
        }
    }
}
