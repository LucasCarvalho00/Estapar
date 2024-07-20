//
//  HelpCenterAssemblyProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

protocol HelpCenterAssemblyProtocol {
    func makeHelpCenterHomeViewController() -> HelpCenterHomeViewController
    func makeHelpCenterHomeViewModelProtocol() -> HelpCenterHomeViewModel
    func makeHelpCenterHomeViewProtocol() -> HelpCenterHomeViewProtocol
    func makeHelpCenterDetailViewController(id: String) -> HelpCenterDetailViewController
    func makeHelpCenterDetailViewModelProtocol(id: String) -> HelpCenterDetailViewModelProtocol
    func makeHelpCenterDetailViewProtocol() -> HelpCenterDetailViewProtocol
    func makeHelpCenterCategoriesUseCaseProtocol() -> HelpCenterCategoriesUseCaseProtocol
    func makeHelpCenterCategoriesByIDUseCaseProtocol() -> HelpCenterCategoriesByIDUseCaseProtocol
}
