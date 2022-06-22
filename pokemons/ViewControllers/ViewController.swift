//
//  ViewController.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import UIKit

class ViewController: UITableViewController {

    private var offset = 0
    var pokemonArray = [Pokemon]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        navigationItem.title = ViewControllerConstants.title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ViewControllerConstants.tableRowHeight
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let pokemonCell = tableView.dequeueReusableCell(withIdentifier: ViewControllerConstants.cellId, for: indexPath) as? PokemonCell else {
            return cell
        }
        pokemonCell.configure(pokemons: pokemonArray, index: indexPath.row)
        cell = pokemonCell
        if tableView.contentOffset.y > (tableView.contentSize.height - tableView.frame.size.height) {
            fetchData()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: ViewControllerConstants.detailVCId) as? DetailViewController else {
            return
        }
        vc.selectedPokemon = pokemonArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchData(completed: ((Bool) -> Void)? = nil) {
        DataService.shared.getPokemons(perPage: 20, offset: offset) { result in
            switch result {
            case .success(let pokemons):
                self.pokemonArray.append(contentsOf: pokemons)
                self.offset += 20
                completed?(true)
            case .failure(let error):
                print(error.localizedDescription)
                completed?(false)
            }
        }
    }
    
}

