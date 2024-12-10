//
//  ServiceProxyProtocol.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 20/4/24.
//

import Foundation

protocol ServiceProxyProtocol {
    func getItem<T: Decodable>(url: URL, type: T.Type, completion: @escaping (Result<T, APIError>) -> Void)
}
