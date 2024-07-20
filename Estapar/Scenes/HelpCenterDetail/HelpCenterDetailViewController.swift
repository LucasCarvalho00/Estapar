//
//  HelpCenterDetailViewController.swift
//  Estapar
//
//  Created by Lucas on 20/07/24.
//

import UIKit

class HelpCenterDetailViewController: UIViewController {
    
    // MARK: - Private Attributes

    private let viewProtocol: HelpCenterDetailViewProtocol
    private let viewModelProtocol: HelpCenterDetailViewModelProtocol

    // MARK: - Internal Attributes

    var flowProtocol: HelpCenterDetailViewFlowProtocol?
    
    // MARK: - Setup

    init(
        viewProtocol: HelpCenterDetailViewProtocol,
        viewModelProtocol: HelpCenterDetailViewModelProtocol
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
        viewModelProtocol.initState()
        hideKeyboardWhenTappedAround()
    }
}

// MARK: - Extensions

extension HelpCenterDetailViewController: HelpCenterDetailViewControllerProtocol {
    func setupUI(with state: HelpCenterDetailViewState) {
        viewProtocol.setupUI(with: state)
    }
}

extension HelpCenterDetailViewController: HelpCenterDetailViewViewControllerProtocol {
    func didTapReload() {
        viewModelProtocol.initState()
    }
    
    func goToHelpCenterHomeViewController() {
        dismiss(animated: true) { [weak self] in
            self?.flowProtocol?.goToHelpCenterHomeViewController()
        }
    }
}
