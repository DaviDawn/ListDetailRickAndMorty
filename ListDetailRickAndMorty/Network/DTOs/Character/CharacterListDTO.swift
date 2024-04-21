//
//  CharacterListDTO.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import Foundation

struct CharacterListDTO: Decodable {
    let info: InfoDTO?
    let results: [CharacterDTO]?
}
