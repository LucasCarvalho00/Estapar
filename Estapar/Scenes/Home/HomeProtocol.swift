//
//  HomeProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

// MARK: - ViewController

protocol HomeViewControllerProtocol: AnyObject {
    var flowProtocol: HomeViewFlowProtocol? { get set }
    func setupUI(with viewState: HomeViewState)
}

// MARK: - ViewModel

protocol HomeViewModelProtocol: AnyObject {
    var viewController: HomeViewControllerProtocol? { get set }
    func initState()
}

// MARK: - FlowController

protocol HomeViewFlowProtocol: AnyObject { 
    func goToHelpCenterHomeViewController()
}
