//
//  ViewController.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import UIKit

class ViewController: UITableViewController {

    var pokemonArray = [Pokemon]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.shared.getPokemons { pokemons in
            self.pokemonArray = pokemons
        }
        navigationItem.title = "Pokemons"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let pokemonCell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokemonCell else {
            return cell
        }
        pokemonCell.configure(pokemons: pokemonArray, index: indexPath.row)
        cell = pokemonCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else {
            return
        }
        vc.selectedPokemon = pokemonArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

