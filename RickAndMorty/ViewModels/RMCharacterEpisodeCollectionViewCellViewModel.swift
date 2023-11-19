//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 19.11.2023.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    
    private let episodeDataIrl : URL?
    
    init(episodeDataIrl : URL?) {
        self.episodeDataIrl = episodeDataIrl
    }
}
