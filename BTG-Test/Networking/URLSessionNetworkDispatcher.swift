//
//  URLSessionNetworkDispatcher.swift
//  BTG-Test
//
//  Created by Matheus De Mattos Pereira on 15/09/19.
//  Copyright © 2019 Matheus De Mattos Pereira. All rights reserved.
//

import Foundation

public protocol NetworkDispatcher {
    func dispatch(request: RequestData, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void)
}

public enum ConnError: Swift.Error {
    case invalidURL
    case noData
}

public struct URLSessionNetworkDispatcher: NetworkDispatcher {
    public static let instance = URLSessionNetworkDispatcher()
    private init() {}
    
    public func dispatch(request: RequestData, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = URL(string: request.path) else {
            onError(ConnError.invalidURL)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method
        
        do {
            if let params = request.params {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            }
        } catch let error {
            onError(error)
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                onError(error)
                return
            }
            
            guard let _data = data else {
                onError(ConnError.noData)
                return
            }
            
            onSuccess(_data)
            }.resume()
    }
}
