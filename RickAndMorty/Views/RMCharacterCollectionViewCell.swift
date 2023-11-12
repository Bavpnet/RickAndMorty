//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 12.11.2023.
//

import UIKit

final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubViews(imageView, nameLabel, statusLabel)
        addConstraints()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),

           statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
           statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
           nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
           nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),

           statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
           nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor),
            
           imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
           imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
           imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
           imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),
       ])
     
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel){
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage {[weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
