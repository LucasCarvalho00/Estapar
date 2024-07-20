//
//  HelpCenterAssembly.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

final class HelpCenterAssembly: HelpCenterAssemblyProtocol {

    // MARK: - Private Attributes
    
    private let foundationAssemblyProtocol: FoundationAssemblyProtocol
    
    // MARK: - Initializer
    
    init(
        foundationAssemblyProtocol: FoundationAssemblyProtocol
    ) {
        self.foundationAssemblyProtocol = foundationAssemblyProtocol
    }
    
    // MARK: - Internal Functions
    
    func makeHelpCenterHomeViewProtocol() -> HelpCenterHomeViewProtocol {
        HelpCenterHomeView()
    }
    
    func makeHelpCenterHomeViewModelProtocol() -> HelpCenterHomeViewModel {
        HelpCenterHomeViewModel(
            helpCenterCategoriesUseCaseProtocol: makeHelpCenterCategoriesUseCaseProtocol(),
            imageByURLUseCaseProtocol: foundationAssemblyProtocol.makeImageByURLUseCaseProtocol()
        )
    }
    
    func makeHelpCenterHomeViewController() -> HelpCenterHomeViewController {
        let view = makeHelpCenterHomeViewProtocol()
        let viewModel = makeHelpCenterHomeViewModelProtocol()
        let viewController = HelpCenterHomeViewController(viewProtocol: view, viewModelProtocol: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
    
    func makeHelpCenterCategoriesUseCaseProtocol() -> HelpCenterCategoriesUseCaseProtocol {
        HelpCenterCategoriesUseCase(network: foundationAssemblyProtocol.makeNetworkOperationProtocol())
    }
    
    func makeHelpCenterCategoriesByIDUseCaseProtocol() -> HelpCenterCategoriesByIDUseCaseProtocol {
        HelpCenterCategoriesByIDUseCase(network: foundationAssemblyProtocol.makeNetworkOperationProtocol())
    }
    
    func makeHelpCenterDetailViewController(id: String) -> HelpCenterDetailViewController {
        let view = makeHelpCenterDetailViewProtocol()
        let viewModel = makeHelpCenterDetailViewModelProtocol(id: id)
        let viewController = HelpCenterDetailViewController(viewProtocol: view, viewModelProtocol: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
    
    func makeHelpCenterDetailViewModelProtocol(id: String) -> HelpCenterDetailViewModelProtocol {
        HelpCenterDetailViewModel(id: id, helpCenterCategoriesByIDUseCaseProtocol: makeHelpCenterCategoriesByIDUseCaseProtocol())
    }
    
    func makeHelpCenterDetailViewProtocol() -> HelpCenterDetailViewProtocol {
        HelpCenterDetailView()
    }
}
