//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 19.11.2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
  static let cellIdentifier = "RMCharacterInfoCollectionViewCell"

  private let valueLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 20, weight: .medium)
    return label
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 20, weight: .medium)
    return label
  }()

  private let iconImageView: UIImageView = {
    let icon = UIImageView()
    icon.translatesAutoresizingMaskIntoConstraints = false
    icon.contentMode = .scaleAspectFit
    return icon
  }()

  private let titleContainerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .tertiarySystemFill
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .secondarySystemBackground
    contentView.layer.cornerRadius = 8
    contentView.layer.masksToBounds = true
    contentView.addSubViews(titleContainerView, valueLabel, iconImageView)
    titleContainerView.addSubview(titleLabel)
    setUpConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      titleContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      titleContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      titleContainerView.heightAnchor.constraint(
        equalTo: contentView.heightAnchor, multiplier: 0.33),

      titleLabel.leftAnchor.constraint(equalTo: titleContainerView.leftAnchor),
      titleLabel.rightAnchor.constraint(equalTo: titleContainerView.rightAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
      titleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor),

      valueLabel.leftAnchor.constraint(equalTo: iconImageView.leftAnchor, constant: 60),
      valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      valueLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor, constant: -10),
      valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -32),

      iconImageView.heightAnchor.constraint(equalToConstant: 48),
      iconImageView.widthAnchor.constraint(equalToConstant: 48),
      iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),

    ])
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    valueLabel.text = nil
    titleLabel.text = nil
    iconImageView.image = nil
  }

  public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
    titleLabel.text = viewModel.title
    valueLabel.text = viewModel.displayValue
    iconImageView.image = viewModel.iconImage
    iconImageView.tintColor = viewModel.tintColor
    titleLabel.textColor = viewModel.tintColor
  }
}
