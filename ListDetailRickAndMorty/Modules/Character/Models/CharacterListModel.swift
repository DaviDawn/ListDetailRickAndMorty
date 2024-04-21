//
//  CharacterListModel.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import Foundation

struct CharacterListModel {
    var info: InfoModel
    var characters: [CharacterModel]
    
    init() {
        characters = []
        info = InfoModel(dto: InfoDTO(count: 0, pages: 0, next: ""))
    }
    
    init(dto: CharacterListDTO) {
        self.info = InfoModel(dto: dto.info)
        self.characters = dto.results?.compactMap({ CharacterModel(dto: $0) }) ?? []
    }
}
