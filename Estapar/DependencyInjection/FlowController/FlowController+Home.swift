//
//  FlowController+Home.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

// MARK: - HomeViewController

extension FlowController: HomeViewFlowProtocol {
    func goToHelpCenterHomeViewController() {
        let viewController = factory.makeHelpCenterHomeViewController()
        viewController.flowProtocol = self
        navigationController?.present(viewController, animated: true)
    }
}
