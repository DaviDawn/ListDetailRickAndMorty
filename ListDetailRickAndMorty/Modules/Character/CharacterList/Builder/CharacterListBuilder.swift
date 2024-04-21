//
//  CharacterListBuilder.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import UIKit

final class CharacterListBuilder: Builder {
    var coordinator: CharacterCoordinator
    
    init(coordinator: CharacterCoordinator) {
        self.coordinator = coordinator
    }
    
    func build() -> UIViewController {
        let useCase = CharacterListUseCase(serviceProxy: ServiceProxy())
        let viewModel = CharacterListViewModel(coordinator: coordinator, useCase: useCase)
        let viewController = CharacterListViewController(viewModel: viewModel)
        return viewController
    }
}
