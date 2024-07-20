//
//  HomeViewController.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Private Attributes

    private let viewProtocol: HomeViewProtocol
    private let viewModelProtocol: HomeViewModelProtocol

    // MARK: - Internal Attributes

    var flowProtocol: HomeViewFlowProtocol?
    
    // MARK: - Setup

    init(
        viewProtocol: HomeViewProtocol,
        viewModelProtocol: HomeViewModelProtocol
    ) {
        self.viewProtocol = viewProtocol
        self.viewModelProtocol = viewModelProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        viewProtocol.delegate = self
        view = viewProtocol.content
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions

extension HomeViewController: HomeViewControllerProtocol {    
    func setupUI(with state: HomeViewState) {
        viewProtocol.setupUI(with: state)
    }
}

extension HomeViewController: HomeViewViewControllerProtocol {
    func goToHelpCenterHomeViewController() {
        flowProtocol?.goToHelpCenterHomeViewController()
    }
}
