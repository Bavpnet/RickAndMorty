//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 16.11.2023.
//

import Foundation


final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    init (character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
