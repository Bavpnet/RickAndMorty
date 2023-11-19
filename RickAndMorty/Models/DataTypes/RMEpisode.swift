//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 12.11.2023.
//

import Foundation

struct MSEpisose: Codable {
  let id: Int
  let name: String
  let airDate: String
  let episode: String
  let characters: [String]
  let url: String
  let created: String
}
