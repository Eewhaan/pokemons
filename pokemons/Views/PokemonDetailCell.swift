//
//  PokemonDetailCell.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import UIKit

class PokemonDetailCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(pokemon detail: PokemonDetail, index: Int) {
        switch index {
        case 1:
            self.titleLabel.text = "Name"
            self.detailLabel.text = detail.name.capitalized
        case 2:
            self.titleLabel.text = "Base Experience"
            self.detailLabel.text = String(describing: detail.base_experience)
        default:
            break
        }
    }
}
