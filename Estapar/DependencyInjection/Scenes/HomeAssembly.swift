//
//  HomeAssembly.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

final class HomeAssembly: HomeAssemblyProtocol {

    // MARK: - Private Attributes
    
    private let foundationAssemblyProtocol: FoundationAssemblyProtocol
    
    // MARK: - Initializer
    
    init(
        foundationAssemblyProtocol: FoundationAssemblyProtocol
    ) {
        self.foundationAssemblyProtocol = foundationAssemblyProtocol
    }
    
    // MARK: - Internal Functions
    
    func makeHomeViewController() -> HomeViewController {
        let view = makeHomeViewProtocol()
        let viewModel = makeHomeViewModelProtocol()
        let viewController = HomeViewController(viewProtocol: view, viewModelProtocol: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
    
    func makeHomeViewModelProtocol() -> HomeViewModelProtocol {
        HomeViewModel()
    }
    
    func makeHomeViewProtocol() -> HomeViewProtocol {
        HomeView()
    }
}
