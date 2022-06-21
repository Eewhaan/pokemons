//
//  ImageView.swift
//  pokemons
//
//  Created by Ivan Pavic on 20.6.22..
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data, scale: 0.5) else { return }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
