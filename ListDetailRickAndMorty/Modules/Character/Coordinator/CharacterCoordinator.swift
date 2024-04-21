//
//  CharacterCoordinator.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 18/4/24.
//

import UIKit

protocol CharacterListNavigation {
    func goToDetail(id: Int)
}

class CharacterCoordinator: Coordinator {
    private var currentState: CharacterCoordinatorState
    private var navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        currentState = .idle
        self.navigationController = navigationController
    }
    
    func start() {
        currentState = .showList
        next()
    }
}

extension CharacterCoordinator: CharacterListNavigation {
    func goToDetail(id: Int) {
        currentState = .showDetail(id)
        next()
    }
}

private extension CharacterCoordinator {
    enum CharacterCoordinatorState {
        case idle
        case showList
        case showDetail(Int)
    }
    
    func next() {
        switch currentState {
        case .idle:
            break
        case .showList:
            showList()
        case .showDetail(let id):
            showDetail(id: id)
        }
    }
    
    func showList() {
        let viewController = CharacterListBuilder(coordinator: self).build()
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func showDetail(id: Int) {
        let viewController = CharacterDetailBuilder(id: id).build()
        navigationController.pushViewController(viewController, animated: true)
    }
}
