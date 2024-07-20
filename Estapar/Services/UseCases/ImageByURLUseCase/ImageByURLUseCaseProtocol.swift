//
//  ImageByURLUseCaseProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

protocol ImageByURLUseCaseProtocol {
    func getImage(url: String, completion: @escaping (Result<ImageByURLUseCaseResponse, NetworkOperationError>) -> Void)
}
