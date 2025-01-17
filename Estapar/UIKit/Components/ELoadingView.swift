//
//  ELoadingView.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

final class ELoadingView: UIView {
    
    // MARK: - Constants

    private struct Metrics {
        static let progressScale: CGFloat = 1.5
    }
    
    // MARK: - Life Cyle

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    // MARK: - UI
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBackground
        return view
    }()
    
    private lazy var indicatorProgressView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .ePrimary
        return indicator
    }()
    
    // MARK: - Setup

    private func constraintUI() {
        addSubview(indicatorProgressView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            indicatorProgressView.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicatorProgressView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    // MARK: - Internal Functions
        
    func startLoad() {
        indicatorProgressView.transform = CGAffineTransform(scaleX: Metrics.progressScale, y: Metrics.progressScale)
        indicatorProgressView.startAnimating()
    }
    
    func stopLoad() {
        indicatorProgressView.startAnimating()
    }
}
