//
//  CharacterDetailViewModelTest.swift
//  ListDetailRickAndMortyTests
//
//  Created by David Alba on 21/4/24.
//

import XCTest
@testable import ListDetailRickAndMorty

final class CharacterDetailViewModelTest: XCTestCase {
    func test_given_successResult_then_viewModelStateIsExpectedState() {
        // given
        let sut = makeSut(result: .success(CharacterModel.mockModel()))
        // when
        sut.viewDidLoad()
        // then
        XCTAssertEqual(sut.state.value, .loadCharacter)
    }
    
    func test_given_failureResult_then_viewModelStateIsExpectedState() {
        // given
        let sut = makeSut(result: .failure(.emptyResponse))
        // when
        sut.viewDidLoad()
        // then
        XCTAssertEqual(sut.state.value, .alertError)
    }
    
    func makeSut(result: Result<ListDetailRickAndMorty.CharacterModel, ListDetailRickAndMorty.APIError>) -> CharacterDetailViewModel {
        CharacterDetailViewModel(id: 0,
                                 useCase: CharacterDetailUseCaseMock(result: result))
    }
}

extension CharacterModel {
    static func mockModel() -> Self {
        CharacterModel(dto: CharacterDTO(id: nil, name: nil, status: nil, species: nil, type: nil, gender: nil, origin: nil, location: nil, image: nil))
    }
}
