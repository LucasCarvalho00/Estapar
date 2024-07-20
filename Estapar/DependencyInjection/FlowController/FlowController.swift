//
//  FlowController.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

final class FlowController {
    
    // MARK: - Internal Attributes

    weak var navigationController: UINavigationController?
    let factory: ScenesFactoryProtocol
    
    // MARK: - Setup

    init(navigationController: UINavigationController,
         factory: ScenesFactoryProtocol) {
        self.navigationController = navigationController
        self.factory = factory
    }
        
    // MARK: - Internal Functions

    func start() {
        let viewController = factory.makeHomeViewController()
        viewController.flowProtocol = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}
