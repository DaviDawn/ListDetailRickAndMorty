//
//  CharacterDetailBuilder.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import UIKit

final class CharacterDetailBuilder: Builder {
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func build() -> UIViewController {
        let useCase = CharacterDetailUseCase(serviceProxy: ServiceProxy())
        let viewModel = CharacterDetailViewModel(id: id, useCase: useCase)
        let viewController = CharacterDetailViewController(viewModel: viewModel)
        return viewController
    }
}
