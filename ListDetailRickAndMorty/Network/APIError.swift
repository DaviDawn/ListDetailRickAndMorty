//
//  APIError.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 20/4/24.
//

import Foundation

enum APIError: Error {
    case undefined(Error?)
    case notFound
    case invalidResponse
    case emptyResponse
    case unableToDecode
}
