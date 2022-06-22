//
//  AbilitiesCell.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import UIKit


class AbilitiesCell: UITableViewCell {

    @IBOutlet weak var abilitiesCV: UICollectionView!

    
    
    var abilities = [Ability]() {
        didSet {
            layoutIfNeeded()
            DispatchQueue.main.async { [weak self] in
                self?.abilitiesCV.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        abilitiesCV.dataSource = self
        abilitiesCV.delegate = self
    }
}
