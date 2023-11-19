//
//  RMCharacterDetailView.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 16.11.2023.
//

import UIKit

final class RMCharacterDetailView: UIView {
    
    
    
    public var collectionView: UICollectionView?
    private let viewModel: RMCharacterDetailViewViewModel
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()


     init(frame: CGRect, viewModel: RMCharacterDetailViewViewModel) {
         self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .systemPurple
        translatesAutoresizingMaskIntoConstraints = false
        //spinner.startAnimating()
        
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        addSubViews(collectionView, spinner)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addConstraints() {
        guard let collectionView = collectionView else {
            return
        }
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createCollectionView()-> UICollectionView{
        let layout = UICollectionViewCompositionalLayout{ sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(RMCharacterPhotoCollectionViewCell.self,
                                forCellWithReuseIdentifier: RMCharacterPhotoCollectionViewCell.cellIdentifier)
        
        collectionView.register(RMCharacterInfoCollectionViewCell.self,
                                forCellWithReuseIdentifier: RMCharacterInfoCollectionViewCell.cellIdentifier)
        
        collectionView.register(RMCharacterEpisodeCollectionViewCell.self,
                                forCellWithReuseIdentifier: RMCharacterEpisodeCollectionViewCell.cellIdentifier)
        
        
        return collectionView
    }
    
    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection{
        
        let sectionTypes = viewModel.sections
        
        switch sectionTypes[sectionIndex]{
            case .photo:
            return viewModel.createPhotoSectionLayout()
            case .information:
            return viewModel.createInformationSectionLayout()
        case .episodes:
            return viewModel.createEpisodesSectionLayout()
        }
       
    }
}
