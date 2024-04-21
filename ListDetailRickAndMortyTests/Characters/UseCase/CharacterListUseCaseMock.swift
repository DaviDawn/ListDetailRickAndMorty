//
//  CharacterListUseCaseMock.swift
//  ListDetailRickAndMortyTests
//
//  Created by David Alba on 21/4/24.
//

import Foundation
@testable import ListDetailRickAndMorty

struct CharacterListUseCaseMock: CharacterListUseCaseProtocol {
    var expectedResult: Result<ListDetailRickAndMorty.CharacterListModel, ListDetailRickAndMorty.APIError>
    
    init(result: Result<ListDetailRickAndMorty.CharacterListModel, ListDetailRickAndMorty.APIError>) {
        self.expectedResult = result
    }
    
    func getCharactersList(completion: @escaping (Result<ListDetailRickAndMorty.CharacterListModel, ListDetailRickAndMorty.APIError>) -> Void) {
        completion(expectedResult)
    }
}
