//
//  CharacterDTO.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import Foundation

struct CharacterDTO: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: LocationDTO?
    let location: LocationDTO?
    let image: String?
}
