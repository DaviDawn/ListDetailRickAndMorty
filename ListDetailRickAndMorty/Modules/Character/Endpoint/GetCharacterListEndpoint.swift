//
//  GetCharacterListEndpoint.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 20/4/24.
//

import Foundation

struct GetCharacterListEndpoint {
    func getUrl(page: Int) -> URL? {
        var components = URLComponents()
        components.scheme = CharacterEndpoint.scheme.rawValue
        components.host = CharacterEndpoint.base.rawValue
        components.path = CharacterEndpoint.path.rawValue
        components.queryItems = [
            URLQueryItem(name: CharacterEndpoint.page.rawValue, value: "\(page)")
        ]
        return components.url
    }
}
