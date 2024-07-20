//
//  HelpCenterDetailProtocol.swift
//  Estapar
//
//  Created by Lucas on 20/07/24.
//

import UIKit

// MARK: - ViewController

protocol HelpCenterDetailViewControllerProtocol: AnyObject {
    var flowProtocol: HelpCenterDetailViewFlowProtocol? { get set }
    func setupUI(with viewState: HelpCenterDetailViewState)
}

// MARK: - ViewModel

protocol HelpCenterDetailViewModelProtocol: AnyObject {
    var viewController: HelpCenterDetailViewControllerProtocol? { get set }
    func initState()
}

// MARK: - FlowController

protocol HelpCenterDetailViewFlowProtocol: AnyObject {
    func goToHelpCenterHomeViewController()
}
