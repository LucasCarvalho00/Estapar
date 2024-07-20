//
//  HomeView.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

final class HomeView: UIView {
    
    // MARK: - Constants
    
    private struct Metrics {
        static let borderWidth: CGFloat = 1.0
        static let borderRadius: CGFloat = 10.0
        static let buttonHeight: CGFloat = 45.0
    }
    
    private struct Constants {
        static let buttonText: String = NSLocalizedString("Abrir central de ajuda", comment: "")
    }
    
    // MARK: - Delegates
    
    weak var delegate: HomeViewViewControllerProtocol?

    // MARK: - UI
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.buttonText, for: .normal)
        button.setTitleColor(.primary ,for: .normal)
        button.layer.borderColor = UIColor.ePrimary.cgColor
        button.layer.borderWidth = Metrics.borderWidth
        button.layer.cornerRadius = Metrics.borderRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions

    @objc private func didTapButton() {
        delegate?.goToHelpCenterHomeViewController()
    }
    
    // MARK: - Life Cyle

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
        self.backgroundColor = .eBackground
    }

    @available (*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    func setup() {
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(button)
    }
    
    private func addConstraints() {
        contentView.constraintToSuperview()

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: EMetrics.xxlMargin),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -EMetrics.xxlMargin),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

// MARK: - Extension

extension HomeView: HomeViewProtocol {
    func setupUI(with viewState: HomeViewState) {
        switch viewState {
        case .hasData:
            break
        }
    }
}
