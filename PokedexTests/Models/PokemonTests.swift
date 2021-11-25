//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Christian Gaiola on 25/11/2021.
//

import Nimble
import XCTest
@testable import Pokedex

class PokemonTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    func testPokemonName_shouldBePikachu_whenInitializedWithPikachu() {
        let pikachu = Pokemon(name: "Pikachu", order: 0, types: [.electric])
        
        XCTAssertEqual(pikachu.name, "Pikachu")
        
        expect(pikachu.name).to(equal("Pikachu"))
    }
    
    func testPokemonType_shouldBeElectric_whenInitializedWithElectric() {
        let pikachu = Pokemon(name: "Pikachu", order: 0, types: [.electric])
        
        XCTAssert(pikachu.types.contains(.electric))
    }
    
    func testPokemonType_shouldBeElectricAndFire_whenInitializedWithElectricAndFire() {
        let pikachu = Pokemon(name: "Pikachu", order: 0, types: [.electric, .fire])
        
        XCTAssert(pikachu.types == [.fire, .electric])
    }
    
    func testPokemonName_shouldBePikachu_whenInitializedWithSmallInit() {
        let pikachu = Pokemon(name: "Pikachu")
        
        XCTAssertEqual(pikachu.name, "Pikachu")
    }
}
