//
//  CollectionViewCell.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var abilityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        abilityName.layer.backgroundColor = UIColor.systemCyan.cgColor
        abilityName.layer.cornerRadius = 5
        abilityName.textAlignment = .center
        abilityName.textColor = UIColor.white
    }
    
    func configure(abilities: [Ability], index: Int) {
        self.abilityName.text = abilities[index].ability.name.capitalized
    }
}
