//
//  DependencyGraph.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

final class DependencyGraph: DependencyGraphProtocol {
    
    // MARK: - Private Attributes
    
    private let navigationController: UINavigationController
    private let foundationAssemblyProtocol: FoundationAssemblyProtocol
    private let scenesFactoryProtocol: ScenesFactoryProtocol
    private let homeAssemblyProtocol: HomeAssemblyProtocol
    private let helpCenterAssemblyProtocol: HelpCenterAssemblyProtocol

    // MARK: - Initializer
    
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
        self.foundationAssemblyProtocol = FoundationAssembly()
        self.homeAssemblyProtocol = HomeAssembly(foundationAssemblyProtocol: foundationAssemblyProtocol)
        self.helpCenterAssemblyProtocol = HelpCenterAssembly(foundationAssemblyProtocol: foundationAssemblyProtocol)
        self.scenesFactoryProtocol = ScenesFactory(
            homeAssemblyProtocol: homeAssemblyProtocol,
            helpCenterAssemblyProtocol: helpCenterAssemblyProtocol)
    }
    
    // MARK: - Internal Functions

    func makeFlowController() -> FlowController {
        FlowController(navigationController: navigationController, factory: scenesFactoryProtocol)
    }
}
