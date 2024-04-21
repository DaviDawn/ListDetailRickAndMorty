//
//  CharacterListViewModel.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 18/4/24.
//

import Foundation
import Combine

enum CharacterListState {
    case idle
    case loadList
    case alertError
}

final class CharacterListViewModel {
    private let coordinator: CharacterListNavigation
    private(set) var list = CharacterListModel()
    private let useCase: CharacterListUseCaseProtocol
    
    var state = CurrentValueSubject<CharacterListState, Never>(.idle)
    
    init(coordinator: CharacterListNavigation, useCase: CharacterListUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        loadList()
    }
    
    func needMoreCharacters() {
        loadList()
    }
    
    func didTapCell(position: Int) {
        coordinator.goToDetail(id: list.characters[position].id)
    }
}

private extension CharacterListViewModel {
    func loadList() {
        useCase.getCharactersList { [weak self] result in
            switch result {
            case .success(let list):
                self?.list.characters.append(contentsOf: list.characters)
                self?.state.send(.loadList)
            case .failure:
                self?.state.send(.alertError)
            }
        }
    }
}
