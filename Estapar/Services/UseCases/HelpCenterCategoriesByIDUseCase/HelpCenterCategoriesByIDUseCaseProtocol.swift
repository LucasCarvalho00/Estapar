//
//  HelpCenterCategoriesByIDUseCaseProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

protocol HelpCenterCategoriesByIDUseCaseProtocol {
    func getHelpCenterCategoriesByIDUseCaseProtocol(id: String, completion: @escaping (Result<HelpCenterCategoriesByIDUseCaseResponse, NetworkOperationError>) -> Void)
}
