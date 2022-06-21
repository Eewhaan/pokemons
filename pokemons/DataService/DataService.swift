//
//  DataService.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import Foundation

class DataService {
    
    static let shared = DataService()
    
    private init() {}
    
    func getPokemons(perPage: Int, offset: Int, _ completion: @escaping (Result<[Pokemon], APIError>) -> Void) {
        var components = URLComponents(string: "https://pokeapi.co/api/v2/pokemon")
        components?.queryItems = [
            URLQueryItem(name: "per-page", value: "\(perPage)"),
            URLQueryItem(name: "offset", value: "\(offset)")
        ]
        guard let url = components?.url else {
            print("Error creating URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            guard let data = data else {
                print("Error: unable to get Pokemons")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(Pokemons.self, from: data)
                let pokemons = decodedData.results
                completion(.success(pokemons))
            } catch {
                print ("Error decoding")
                return
            }
        }.resume()
    }
    
    func getPokemonDetail(pokemonUrl: String, _ completion: @escaping (PokemonDetail) -> Void) {
        guard let url = URL(string: pokemonUrl) else {
            print("Error creating url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Eror:\(error?.localizedDescription)")
                return
            }
            guard let data = data else {
                print("Error: unable to get Pokemon details")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(PokemonDetail.self, from: data)
                let pokemonDetail = PokemonDetail(abilities: decodedData.abilities, base_experience: decodedData.base_experience, name: decodedData.name, sprites: decodedData.sprites)
                completion(pokemonDetail)
            } catch let error {
                print (error)
                return
            }
        }.resume()
    }

}
