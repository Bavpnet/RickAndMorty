//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 19.11.2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {

  private let type: `Type`
  private let value: String
  public var title: String {
    type.displayTitle
  }

  public var displayValue: String {
    if value.isEmpty { return "None" }
    return value
  }

  enum `Type` {
    case status
    case gender
    case type
    case species
    case origin
    case created
    case location
    case episodeCount

    var displayTitle: String {
      switch self {
      case .status:
        return "Status"
      case .gender:
        return "Gender"
      case .type:
        return "Type"
      case .species:
        return "Specie"
      case .origin:
        return "Origin"
      case .created:
        return "Created"
      case .location:
        return "Location"
      case .episodeCount:
        return "Num of episodes"

      }
    }

    var iconImage: UIImage? {
      switch self {
      case .status:
        return UIImage(systemName: "smallcircle.filled.circle")
      case .gender:
        return UIImage(systemName: "person.circle.fill")
      case .type:
        return UIImage(systemName: "character.duployan")
      case .species:
        return UIImage(systemName: "bolt.circle.fill")
      case .origin:
        return UIImage(systemName: "globe.europe.africa.fill")
      case .created:
        return UIImage(systemName: "calendar")
      case .location:
        return UIImage(systemName: "mappin.circle.fill")
      case .episodeCount:
        return UIImage(systemName: "number.circle")

      }
    }

    var tintColor: UIColor {
      switch self {
      case .status:
        return .systemBlue
      case .gender:
        return .systemRed
      case .type:
        return .systemPurple
      case .species:
        return .systemGreen
      case .origin:
        return .systemOrange
      case .created:
        return .systemPink
      case .location:
        return .systemMint
      case .episodeCount:
        return .systemGray

      }
    }
  }

  public var tintColor: UIColor {
    return type.tintColor
  }

  public var iconImage: UIImage? {
    return type.iconImage
  }

  init(type: `Type`, value: String) {

    self.value = value
    self.type = type
  }
}
