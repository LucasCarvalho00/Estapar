//
//  HomeViewProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

// MARK: - EnumState

enum HomeViewState: Equatable {
    case hasData
}

// MARK: - ViewController

protocol HomeViewViewControllerProtocol: AnyObject {
    func goToHelpCenterHomeViewController()
}

// MARK: - View

protocol HomeViewProtocol: AnyObject {
    var content: UIView { get }
    var delegate: HomeViewViewControllerProtocol? { get set }
    func setupUI(with viewState: HomeViewState)
}

// MARK: - Extension

extension HomeViewProtocol where Self: UIView {
    var content: UIView { return self }
}
