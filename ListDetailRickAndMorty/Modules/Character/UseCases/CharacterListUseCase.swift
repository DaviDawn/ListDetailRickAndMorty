//
//  CharacterListUseCase.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 19/4/24.
//

import Foundation

protocol CharacterListUseCaseProtocol {
    func getCharactersList(completion: @escaping(Result<CharacterListModel, APIError>) -> Void)
}

final class CharacterListUseCase: CharacterListUseCaseProtocol {
    private let serviceProxy: ServiceProxyProtocol
    private let endPoint: GetCharacterListEndpoint
    private var page: Int
    private var lastPage: Int?
    
    init(serviceProxy: ServiceProxyProtocol) {
        self.serviceProxy = serviceProxy
        endPoint = GetCharacterListEndpoint()
        page = 0
    }
    
    func getCharactersList(completion: @escaping(Result<CharacterListModel, APIError>) -> Void) {
        page += 1
        guard page <= lastPage ?? 1,
              let url = endPoint.getUrl(page: page)
        else { return }
        
        serviceProxy.getItem(url: url, type: CharacterListDTO.self) { result in
            switch result {
            case .success(let list):
                self.lastPage = list.info?.pages
                completion(.success(CharacterListModel(dto: list)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
