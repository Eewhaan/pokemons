//
//  PokemonCell.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import UIKit

class PokemonCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.layer.cornerRadius = 25
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 1
        avatarImageView.layer.borderColor = UIColor.systemCyan.cgColor
        detailLabel.layer.backgroundColor = UIColor.systemCyan.cgColor
        detailLabel.textColor = UIColor.white
        detailLabel.layer.cornerRadius = 2
    }
    
    func configure(pokemons: [Pokemon], index: Int) {
        self.nameLabel.text = pokemons[index].name.capitalized
        if let url = URL(string: pokemons[index].url) {
            self.avatarImageView.load(url: url)
        }
        self.detailLabel.text = pokemons[index].name.capitalized
    }

}
