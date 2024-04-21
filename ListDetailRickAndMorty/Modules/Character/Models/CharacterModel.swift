//
//  CharacterModel.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import Foundation

struct CharacterModel {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: LocationModel
    let location: LocationModel
    let image: String
    
    init(dto: CharacterDTO?) {
        self.id = dto?.id ?? 0
        self.name = dto?.name ?? ""
        self.status = dto?.status ?? ""
        self.species = dto?.species ?? ""
        self.type = dto?.type ?? ""
        self.gender = dto?.gender ?? ""
        self.origin = LocationModel(dto: dto?.origin)
        self.location = LocationModel(dto: dto?.location)
        self.image = dto?.image ?? ""
    }
}
