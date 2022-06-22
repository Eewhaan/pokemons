//
//  TableRowHeight.swift
//  pokemons
//
//  Created by Ivan Pavic on 21.6.22..
//

import Foundation
import UIKit


struct ViewControllerConstants {
    static let title = "Pokemons"
    static let tableRowHeight: CGFloat = 70
    static let cellId = "PokemonCell"
    static let detailVCId = "Detail"
    
}

struct DetailViewControllerConstants {
    static let imageCellId = "FirstCell"
    static let infoCellId = "DetailCell"
    static let abilityCellId = "AbilitiesCell"
    static let numberOfRows = 4
    static let imageRowHeight: CGFloat = 170
    static let infoRowHeight: CGFloat = 50
    static let abilityCVRowHeight = 70
}

struct ConstantsPokemonCell {
    static let imageCornerRadius: CGFloat = 25
    static let imageBorderWidth: CGFloat = 1
    static let imageBorderColor = UIColor.systemCyan.cgColor
    static let labelCornerRadius: CGFloat = 2
    static let labelBackgroundColor = UIColor.systemCyan.cgColor
    static let labelTextColor = UIColor.white
}
