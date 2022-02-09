//
//  PokemonInfoCell.swift
//  Pokedex
//
//  Created by SAUVAGE Maxime on 26/01/2022.
//

import Foundation
import UIKit

class PokemonInfoCell: UITableViewCell {
    //MARK:- Outlets
    @IBOutlet weak var titleLbl: UILabel!
    
    //MARK:- Methods
    func setTitle(title: String) {
        titleLbl.text = title
    }
    
}
