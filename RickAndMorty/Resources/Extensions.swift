//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 12.11.2023.
//

import UIKit

extension UIView {
  func addSubViews(_ views: UIView...) {
    views.forEach({
      addSubview($0)
    })
  }
}
