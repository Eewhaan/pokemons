//
//  DetailViewController.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import UIKit


class DetailViewController: UITableViewController {
    
    var selectedPokemon: Pokemon?
    var pokemonDetails: PokemonDetail? {
        didSet {
            self.calculateAbilityRowHeight()
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                
            }
        }
    }
    var abilityRowHeight: CGFloat = 0 {
        willSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedPokemon = selectedPokemon else {
            return
        }
        navigationItem.title = selectedPokemon.name.capitalized
        DataService.shared.getPokemonDetail(pokemonUrl: selectedPokemon.url) { details in
            self.pokemonDetails = details
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailViewControllerConstants.numberOfRows
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return DetailViewControllerConstants.imageRowHeight
        case 1..<3:
            return DetailViewControllerConstants.infoRowHeight
        case 3:
            return abilityRowHeight
        default:
            return 0
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let pokemonDetails = pokemonDetails else { return cell }
        
        switch indexPath.row {
        case 0:
            guard let imageCell = tableView.dequeueReusableCell(withIdentifier: DetailViewControllerConstants.imageCellId, for: indexPath) as? PokemonDetailFirstCell else { return cell }
            imageCell.configureAvatar(pokemon: pokemonDetails)
            cell = imageCell
            
        case 1..<3:
            guard let infoCell = tableView.dequeueReusableCell(withIdentifier: DetailViewControllerConstants.infoCellId, for: indexPath) as? PokemonDetailCell else { return cell }
            infoCell.configure(pokemon: pokemonDetails, index: indexPath.row)
            cell = infoCell
            
        case 3:
            guard let abilitiesCell = tableView.dequeueReusableCell(withIdentifier: DetailViewControllerConstants.abilityCellId, for: indexPath) as? AbilitiesCell else { return cell }
            abilitiesCell.abilities = pokemonDetails.abilities
            cell = abilitiesCell
            
        default:
            break
        }
        return cell
    }
    
    func calculateAbilityRowHeight() {
        guard let abilityCount = pokemonDetails?.abilities.count else { return }
        let multiplier = (abilityCount + abilityCount % 2)/2
        abilityRowHeight = CGFloat(multiplier * DetailViewControllerConstants.abilityCVRowHeight)
    }

}
