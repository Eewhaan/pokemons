//
//  AbilitiesCellExt.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import Foundation
import UIKit

extension AbilitiesCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.abilities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AbilityCVCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(abilities: abilities, index: indexPath.row)
        return cell
    }

}
