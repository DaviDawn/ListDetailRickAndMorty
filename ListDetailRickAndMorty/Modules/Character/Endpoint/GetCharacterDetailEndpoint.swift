//
//  GetCharacterDetailEndpoint.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 20/4/24.
//

import Foundation

struct GetCharacterDetailEndpoint {
    func getUrl(id: Int) -> URL? {
        var components = URLComponents()
        components.scheme = CharacterEndpoint.scheme.rawValue
        components.host = CharacterEndpoint.base.rawValue
        components.path = CharacterEndpoint.path.rawValue + "/\(id)"
        return components.url
    }
}
