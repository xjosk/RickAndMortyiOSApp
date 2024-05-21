//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Andrei E. Carvajal Brito on 20/05/24.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
