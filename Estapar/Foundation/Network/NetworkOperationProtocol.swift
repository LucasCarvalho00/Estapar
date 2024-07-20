//
//  NetworkOperationProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

protocol NetworkOperationProtocol {
    func execute<T: Decodable>(request: RequestProtocol, completion: @escaping (Result<T, NetworkOperationError>) -> Void)
}
