//
//  RMGetCharactersResponse.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 12.11.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharacter]
}
