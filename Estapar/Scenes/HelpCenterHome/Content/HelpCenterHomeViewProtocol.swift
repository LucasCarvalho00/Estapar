//
//  HelpCenterHomeViewProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

// MARK: - EnumState

enum HelpCenterHomeViewState: Equatable {
    case hasLoading
    case hasError
    case hasData(HelpCenterHomeDataViewEntity)
}

// MARK: - ViewController

protocol HelpCenterHomeViewViewControllerProtocol: AnyObject {
    func didTapReload()
    func goToHelpCenterDetailViewController(id: String)
}

// MARK: - View

protocol HelpCenterHomeViewProtocol: AnyObject {
    var content: UIView { get }
    var delegate: HelpCenterHomeViewViewControllerProtocol? { get set }
    func setupUI(with viewState: HelpCenterHomeViewState)
}

// MARK: - Extension

extension HelpCenterHomeViewProtocol where Self: UIView {
    var content: UIView { return self }
}
