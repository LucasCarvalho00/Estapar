//
//  HelpCenterHomeView.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

final class HelpCenterHomeView: UIView {
    
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
    
    weak var delegate: HelpCenterHomeViewViewControllerProtocol?
    
    // MARK: - UI
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var viewLoading: ELoadingView = {
        let view = ELoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private lazy var viewError: EErrorView = {
        let view = EErrorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.isHidden = true
        return view
    }()
    
    private lazy var viewData: HelpCenterHomeDataView = {
        let view = HelpCenterHomeDataView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.isHidden = true
        return view
    }()
    
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
        contentView.addSubview(viewLoading)
        contentView.addSubview(viewError)
        contentView.addSubview(viewData)
    }
    
    private func addConstraints() {
        contentView.constraintToSuperview()
        
        NSLayoutConstraint.activate([
            viewLoading.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewLoading.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            viewLoading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewLoading.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            viewError.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewError.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            viewError.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewError.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            viewData.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewData.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            viewData.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewData.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    // MARK: - Private Functions

    private func setLoadingView() {
        viewLoading.isHidden = false
        viewError.isHidden = true
        viewData.isHidden = true
        viewLoading.startLoad()
    }
    
    private func setErrorView() {
        viewLoading.stopLoad()
        viewLoading.isHidden = true
        viewError.isHidden = false
        viewData.isHidden = true
    }
    
    private func setDataView(data: HelpCenterHomeDataViewEntity) {
        viewLoading.stopLoad()
        viewLoading.isHidden = true
        viewError.isHidden = true
        viewData.isHidden = false
        viewData.setupData(data: data)
    }
}

// MARK: - Extension

extension HelpCenterHomeView: HelpCenterHomeViewProtocol {
    func setupUI(with viewState: HelpCenterHomeViewState) {
        switch viewState {
        case .hasLoading:
            setLoadingView()
        case .hasError:
            setErrorView()
        case let .hasData(data):
            setDataView(data: data)
        }
    }
}

extension HelpCenterHomeView: EErrorViewDelegate {
    func didTapReload() {
        delegate?.didTapReload()
    }
}

extension HelpCenterHomeView: HelpCenterHomeDataViewDelegate {
    func goToHelpCenterDetailViewController(id: String) {
        delegate?.goToHelpCenterDetailViewController(id: id)
    }
}
