//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 16.11.2023.
//

import UIKit


final class RMCharacterDetailViewViewModel {
    
    enum SectionType{
        case photo (viewModel: RMCharacterPhotoCollectionViewCellViewModel)
        case information (viewModels: [RMCharacterInfoCollectionViewCellViewModel])
        case episodes (viewModels: [RMCharacterEpisodeCollectionViewCellViewModel])
    }
    
    public var sections: [SectionType] = []
    
    private let character: RMCharacter
    init (character: RMCharacter) {
        self.character = character
        setUpSections()
    }
    
    private var requestUrl: URL?{
        return URL(string: character.url)
    }
    
    
    
    
    
    public var title: String {
        character.name
    }
    
    public func createPhotoSectionLayout() -> NSCollectionLayoutSection{
        
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 0,
                                                     bottom: 10,
                                                     trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    public func createInformationSectionLayout() -> NSCollectionLayoutSection{
        
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 2,
                                                     bottom: 4,
                                                     trailing: 2)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(150)),
            subitems: [item, item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    public func createEpisodesSectionLayout() -> NSCollectionLayoutSection{
        
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 4,
                                                     bottom: 10,
                                                     trailing: 4)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0),
                heightDimension: .absolute(0)),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    
    public func setUpSections(){
        
        sections = [
            .photo(viewModel: .init(imageUrl: URL(string: character.image))),
            .information(viewModels: [.init(type: .status,value: character.status.text),
                                      .init(type: .gender,value: character.gender.rawValue),
                                      .init(type: .type,value: character.type),
                                      .init(type: .species,value: character.species),
                                      .init(type: .origin,value: character.origin.name),
                                      .init(type: .location,value: character.location.name),
                                      .init(type: .created,value: character.created),
                                      .init(type: .episodeCount,value: "\(character.episode.count)")
                                      
            ]),
            .episodes (viewModels: character.episode.compactMap({
                return RMCharacterEpisodeCollectionViewCellViewModel(
                    episodeDataIrl: URL(string: $0))
            }))
        ]
        
        
    }
    
    
}
