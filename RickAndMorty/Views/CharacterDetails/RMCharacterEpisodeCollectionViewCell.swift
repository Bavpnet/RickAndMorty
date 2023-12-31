//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 19.11.2023.
//

import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
  static let cellIdentifier = "RMCharacterEpisodeCollectionViewCell"

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setUpConstraints() {

  }
  override func prepareForReuse() {
    super.prepareForReuse()
  }

  public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellViewModel) {

  }
}
