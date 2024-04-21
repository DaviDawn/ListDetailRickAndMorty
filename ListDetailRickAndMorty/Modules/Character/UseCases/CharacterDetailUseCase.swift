//
//  CharacterDetailUseCase.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import Foundation

protocol CharacterDetailUseCaseProtocol {
    func getCharactersDetail(id: Int, completion: @escaping(Result<CharacterModel, APIError>) -> Void)
}

final class CharacterDetailUseCase: CharacterDetailUseCaseProtocol {
    private let serviceProxy: ServiceProxyProtocol
    
    init(serviceProxy: ServiceProxyProtocol) {
        self.serviceProxy = serviceProxy
    }
    
    func getCharactersDetail(id: Int, completion: @escaping(Result<CharacterModel, APIError>) -> Void) {
        guard let url = GetCharacterDetailEndpoint().getUrl(id: id) else { return }
        
        serviceProxy.getItem(url: url, type: CharacterDTO.self) { result in
            switch result {
            case .success(let character):
                completion(.success(CharacterModel(dto: character)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
