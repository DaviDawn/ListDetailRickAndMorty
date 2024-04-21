//
//  CharacterDetailViewModel.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 18/4/24.
//

import Foundation
import Combine

enum CharacterModelState {
    case idle
    case loadCharacter
    case alertError
}

final class CharacterDetailViewModel {
    private(set) var character: CharacterModel?
    private let useCase: CharacterDetailUseCaseProtocol
    private let id: Int
    
    var state = CurrentValueSubject<CharacterModelState, Never>(.idle)
    
    init(id: Int, useCase: CharacterDetailUseCaseProtocol) {
        self.id = id
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        loadCharacter()
    }
}

private extension CharacterDetailViewModel {
    func loadCharacter() {
        useCase.getCharactersDetail(id: id) { [weak self] result in
            switch result {
            case .success(let character):
                self?.character = character
                self?.state.send(.loadCharacter)
            case .failure:
                self?.state.send(.alertError)
            }
        }
    }
}
