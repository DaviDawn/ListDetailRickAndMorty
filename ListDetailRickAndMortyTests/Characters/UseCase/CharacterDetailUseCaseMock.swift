//
//  CharacterDetailUseCaseMock.swift
//  ListDetailRickAndMortyTests
//
//  Created by David Alba on 21/4/24.
//

import Foundation
@testable import ListDetailRickAndMorty

struct CharacterDetailUseCaseMock: CharacterDetailUseCaseProtocol {
    var expectedResult: Result<ListDetailRickAndMorty.CharacterModel, ListDetailRickAndMorty.APIError>
    
    init(result: Result<ListDetailRickAndMorty.CharacterModel, ListDetailRickAndMorty.APIError>) {
        self.expectedResult = result
    }
    
    func getCharactersDetail(id: Int, completion: @escaping (Result<ListDetailRickAndMorty.CharacterModel, ListDetailRickAndMorty.APIError>) -> Void) {
        completion(expectedResult)
    }
}
