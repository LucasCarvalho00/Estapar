//
//  FoundationAssembly.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

final class FoundationAssembly: FoundationAssemblyProtocol {
        
    // MARK: - Internal Functions
    
    func makeFlowController(scenesFactoryProtocol: ScenesFactoryProtocol, navigationController: UINavigationController) -> FlowController {
        FlowController(
            navigationController: navigationController,
            factory: scenesFactoryProtocol)
    }
    
    func makeNetworkOperationProtocol() -> NetworkOperationProtocol {
        NetworkOperation(mockData: nil)
    }
    
    func makeImageByURLUseCaseProtocol() -> ImageByURLUseCaseProtocol {
        ImageByURLUseCase()
    }
}
