//
//  UppercasedWrapper.swift
//  Pokedex
//
//  Created by SAUVAGE Maxime on 20/01/2022.
//

import Foundation
import UIKit

@propertyWrapper struct Uppercased {
    
    var wrappedValue: String? {
        didSet { self.wrappedValue = self.wrappedValue?.uppercased() }
    }
    
    init(wrappedValue: String?) {
        self.wrappedValue = wrappedValue?.uppercased()
    }
    
}
