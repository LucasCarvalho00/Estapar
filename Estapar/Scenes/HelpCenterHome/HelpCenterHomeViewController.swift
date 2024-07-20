//
//  HelpCenterHomeViewController.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

class HelpCenterHomeViewController: UIViewController {
    
    // MARK: - Private Attributes

    private let viewProtocol: HelpCenterHomeViewProtocol
    private let viewModelProtocol: HelpCenterHomeViewModelProtocol

    // MARK: - Internal Attributes

    var flowProtocol: HelpCenterHomeViewFlowProtocol?
    
    // MARK: - Setup

    init(
        viewProtocol: HelpCenterHomeViewProtocol,
        viewModelProtocol: HelpCenterHomeViewModelProtocol
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
    }
}

// MARK: - Extensions

extension HelpCenterHomeViewController: HelpCenterHomeViewControllerProtocol {
    func setupUI(with state: HelpCenterHomeViewState) {
        viewProtocol.setupUI(with: state)
    }
}

extension HelpCenterHomeViewController: HelpCenterHomeViewViewControllerProtocol {
    func didTapReload() {
        viewModelProtocol.initState()
    }
    
    func goToHelpCenterDetailViewController(id: String) {
        dismiss(animated: true) { [weak self] in
            self?.flowProtocol?.goToHelpCenterDetailViewController(id: id)
        }
    }
}
