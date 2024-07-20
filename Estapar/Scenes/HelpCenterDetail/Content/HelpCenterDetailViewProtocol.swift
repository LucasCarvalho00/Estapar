//
//  HelpCenterDetailViewProtocol.swift
//  Estapar
//
//  Created by Lucas on 20/07/24.
//

import UIKit

// MARK: - EnumState

enum HelpCenterDetailViewState: Equatable {
    case hasLoading
    case hasError
    case hasData(HelpCenterDetailDataViewEntity)
}

// MARK: - ViewController

protocol HelpCenterDetailViewViewControllerProtocol: AnyObject {
    func didTapReload()
    func goToHelpCenterHomeViewController()
}

// MARK: - View

protocol HelpCenterDetailViewProtocol: AnyObject {
    var content: UIView { get }
    var delegate: HelpCenterDetailViewViewControllerProtocol? { get set }
    func setupUI(with viewState: HelpCenterDetailViewState)
}

// MARK: - Extension

extension HelpCenterDetailViewProtocol where Self: UIView {
    var content: UIView { return self }
}
