//
//  HelpCenterCategoriesByIDUseCase.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

class HelpCenterCategoriesByIDUseCase {
    
    // MARK: - Private Attributes

    private let network: NetworkOperationProtocol

    // MARK: - Setup

    init(
        network: NetworkOperationProtocol
    ) {
        self.network = network
    }
}

// MARK: - Extensions

extension HelpCenterCategoriesByIDUseCase: HelpCenterCategoriesByIDUseCaseProtocol {
    func getHelpCenterCategoriesByIDUseCaseProtocol(id: String, completion: @escaping (Result<HelpCenterCategoriesByIDUseCaseResponse, NetworkOperationError>) -> Void) {
        network.execute(request: HelpCenterRequests.getCategoriesByID(id: id), completion: completion)
    }
}
