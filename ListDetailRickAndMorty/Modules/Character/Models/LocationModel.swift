//
//  LocationModel.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import Foundation

struct LocationModel {
    let name: String
    let url: String
    
    init(dto: LocationDTO?) {
        self.name = dto?.name ?? ""
        self.url = dto?.url ?? ""
    }
}
