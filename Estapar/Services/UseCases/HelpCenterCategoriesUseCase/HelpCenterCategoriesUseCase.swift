//
//  HelpCenterCategoriesUseCase.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

class HelpCenterCategoriesUseCase {
    
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

extension HelpCenterCategoriesUseCase: HelpCenterCategoriesUseCaseProtocol {
    func getHelpCenterCategoriesUseCaseProtocol(completion: @escaping (Result<HelpCenterCategoriesUseCaseResponse, NetworkOperationError>) -> Void) {
        network.execute(request: HelpCenterRequests.getCategories, completion: completion)
    }
}
