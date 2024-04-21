//
//  InfoDTO.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import Foundation

struct InfoDTO: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
}
