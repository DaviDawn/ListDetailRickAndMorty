//
//  ServiceProxy.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 18/4/24.
//

import Foundation

protocol ServiceProxyProtocol {
    func getItem<T: Decodable>(url: URL, type: T.Type, completion: @escaping (Result<T, APIError>) -> Void)
}

class ServiceProxy: ServiceProxyProtocol {
    private let session: URLSession
    
    init() {
        session = .shared
    }
    
    func getItem<T: Decodable>(url: URL, type: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.undefined(error)))
                return
            }
            
            guard let httpsResponse = response as? HTTPURLResponse else { return completion(.failure(.invalidResponse)) }
            
            switch httpsResponse.statusCode {
            case 404:
                completion(.failure(.notFound))
            case 200:
                guard let data = data else { return completion(.failure(.emptyResponse)) }
                
                let decoder = JSONDecoder()
                guard let resource = try? decoder.decode(type, from: data) else { return completion(.failure(.unableToDecode)) }
                
                completion(.success(resource))
            default:
                completion(.failure(.undefined(error)))
            }
        }
        
        task.resume()
    }
}
