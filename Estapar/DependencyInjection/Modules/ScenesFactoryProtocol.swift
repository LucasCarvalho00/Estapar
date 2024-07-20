//
//  ScenesFactoryProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

protocol ScenesFactoryProtocol {
    func makeHomeViewController() -> HomeViewController
    func makeHelpCenterHomeViewController() -> HelpCenterHomeViewController
    func makeHelpCenterDetailViewController(id: String) -> HelpCenterDetailViewController
}
