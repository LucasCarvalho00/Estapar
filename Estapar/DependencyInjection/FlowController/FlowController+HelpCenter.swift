//
//  FlowController+HelpCenter.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

// MARK: - HelpCenterHomeViewFlowProtocol

extension FlowController: HelpCenterHomeViewFlowProtocol {
    func goToHelpCenterDetailViewController(id: String) {
        let viewController = factory.makeHelpCenterDetailViewController(id: id)
        viewController.flowProtocol = self
        navigationController?.present(viewController, animated: true)
    }
}

extension FlowController: HelpCenterDetailViewFlowProtocol {
    
}
