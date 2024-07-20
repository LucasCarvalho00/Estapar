//
//  HelpCenterCategoriesUseCaseProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

protocol HelpCenterCategoriesUseCaseProtocol {
    func getHelpCenterCategoriesUseCaseProtocol(completion: @escaping (Result<HelpCenterCategoriesUseCaseResponse, NetworkOperationError>) -> Void)
}
