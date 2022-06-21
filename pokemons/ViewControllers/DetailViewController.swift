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
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                
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
        return 4
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 170
        } else if indexPath.row < 3 {
            return 50
        } else {
            return tableView.contentSize.height + 20
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.row == 0 {
            guard let firstCell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as? PokemonDetailFirstCell,
                  let pokemonDetails = pokemonDetails
            else { return cell }
            firstCell.configureAvatar(pokemon: pokemonDetails)
            cell = firstCell
        } else if indexPath.row < 3 {
            guard let detailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? PokemonDetailCell,
                let pokemonDetails = pokemonDetails
            else { return cell }
            detailCell.configure(pokemon: pokemonDetails, index: indexPath.row)
            cell = detailCell
        } else {
            guard let abilityCell = tableView.dequeueReusableCell(withIdentifier: "AbilitiesCell", for: indexPath) as? AbilitiesCell else { return cell }
            if let abilities = pokemonDetails?.abilities {
                abilityCell.abilities = abilities
            }
            cell = abilityCell
        }
        return cell
    }

}
