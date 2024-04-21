//
//  CharacterCoordinatorMock.swift
//  ListDetailRickAndMortyTests
//
//  Created by David Alba on 21/4/24.
//

import Foundation
@testable import ListDetailRickAndMorty

final class CharacterCoordinatorMock: CharacterListNavigation {
    var didGoToDetail = false
    
    func goToDetail(id: Int) {
        didGoToDetail = true
    }
}
