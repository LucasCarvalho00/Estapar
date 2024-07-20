//
//  HelpCenterHomeProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

// MARK: - ViewController

protocol HelpCenterHomeViewControllerProtocol: AnyObject {
    var flowProtocol: HelpCenterHomeViewFlowProtocol? { get set }
    func setupUI(with viewState: HelpCenterHomeViewState)
}

// MARK: - ViewModel

protocol HelpCenterHomeViewModelProtocol: AnyObject {
    var viewController: HelpCenterHomeViewControllerProtocol? { get set }
    func initState()
}

// MARK: - FlowController

protocol HelpCenterHomeViewFlowProtocol: AnyObject {
    func goToHelpCenterDetailViewController(id: String)
}
