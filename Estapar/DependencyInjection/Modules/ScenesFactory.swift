//
//  ScenesFactory.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

final class ScenesFactory: ScenesFactoryProtocol {
            
    // MARK: - Private Attributes

    private let homeAssemblyProtocol: HomeAssemblyProtocol
    private let helpCenterAssemblyProtocol: HelpCenterAssemblyProtocol

    // MARK: - Initializer
   
    init(
        homeAssemblyProtocol: HomeAssemblyProtocol,
        helpCenterAssemblyProtocol: HelpCenterAssemblyProtocol
    ) {
        self.homeAssemblyProtocol = homeAssemblyProtocol
        self.helpCenterAssemblyProtocol = helpCenterAssemblyProtocol
    }
    
    // MARK: - Internal Functions
    
    func makeHomeViewController() -> HomeViewController {
        homeAssemblyProtocol.makeHomeViewController()
    }
    
    func makeHelpCenterHomeViewController() -> HelpCenterHomeViewController {
        helpCenterAssemblyProtocol.makeHelpCenterHomeViewController()
    }
    
    func makeHelpCenterDetailViewController(id: String) -> HelpCenterDetailViewController {
        helpCenterAssemblyProtocol.makeHelpCenterDetailViewController(id: id)
    }
}
