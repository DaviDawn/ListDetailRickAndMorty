//
//  CharacterListViewModelTest.swift
//  ListDetailRickAndMortyTests
//
//  Created by David Alba on 21/4/24.
//

import XCTest
@testable import ListDetailRickAndMorty

final class CharacterListViewModelTest: XCTestCase {
    func test_given_succesResult_then_viewModelStateIsExpectedState() {
        // given
        let sut = makeSut(result: .success(CharacterListModel.mockModel()))
        // when
        sut.viewDidLoad()
        // then
        XCTAssertEqual(sut.state.value, .loadList)
    }
    
    func test_given_didTapCell_then_viewModelStateIsExpectedState() {
        // given
        let coordinator = CharacterCoordinatorMock()
        XCTAssertFalse(coordinator.didGoToDetail)
        let sut = makeSut(coordinator: coordinator,
                          result: .success(CharacterListModel.mockModel()))
        // when
        sut.viewDidLoad()
        sut.didTapCell(position: 0)
        // then
        XCTAssertTrue(coordinator.didGoToDetail)
    }
    
    func test_given_failureResult_then_viewModelStateIsExpectedState() {
        // given
        let sut = makeSut(result: .failure(.emptyResponse))
        // when
        sut.viewDidLoad()
        // then
        XCTAssertEqual(sut.state.value, .alertError)
    }
    
    func makeSut(coordinator: CharacterListNavigation = CharacterCoordinatorMock(),
                 result: Result<ListDetailRickAndMorty.CharacterListModel, ListDetailRickAndMorty.APIError>) -> CharacterListViewModel {
        CharacterListViewModel(coordinator: coordinator,
                               useCase: CharacterListUseCaseMock(result: result))
    }
}

extension CharacterListModel {
    static func mockModel() -> Self {
        CharacterListModel(dto: CharacterListDTO(info: nil, results: [CharacterDTO(id: nil, name: nil, status: nil, species: nil, type: nil, gender: nil, origin: nil, location: nil, image: nil)]))
    }
}
