//
//  HelpCenterHomeErrorView.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import Foundation
import UIKit

final class EErrorView: UIView {
    
    // MARK: - Constants
    
    private struct Metrics {
        static let borderWidth: CGFloat = 1.0
        static let borderRadius: CGFloat = 10.0
        static let buttonHeight: CGFloat = 45.0
        static let imageHeight: CGFloat = 160.0
    }
    
    private struct Constants {
        static let titleText: String = NSLocalizedString("Recarregar informações", comment: "")
        static let contentText: String = NSLocalizedString("No momento não foi possível mostrar as informações. Que tal tentar novamente?", comment: "")
        static let buttonText: String = NSLocalizedString("Recarregar", comment: "")
    }
    
    // MARK: - Delegates
    
    weak var delegate: EErrorViewDelegate?
    
    // MARK: - Life Cyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBackground
        return view
    }()
    
    private lazy var alertImage: UIImageView = {
        let image = UIImageView()
        image.image = .eImageAlert
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = Constants.titleText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Constants.contentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.buttonText, for: .normal)
        button.setTitleColor(.primary ,for: .normal)
        button.layer.borderColor = UIColor.ePrimary.cgColor
        button.layer.borderWidth = Metrics.borderWidth
        button.layer.cornerRadius = Metrics.borderRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapReload), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    
    @objc private func didTapReload() {
        delegate?.didTapReload()
    }
    
    // MARK: - Setup
    
    private func constraintUI() {
        addSubview(contentView)
        contentView.addSubview(alertImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(reloadButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            alertImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            alertImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            alertImage.heightAnchor.constraint(equalToConstant: Metrics.imageHeight),

            titleLabel.topAnchor.constraint(equalTo: alertImage.bottomAnchor, constant: EMetrics.xxlMargin),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: EMetrics.xlMargin),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -EMetrics.xlMargin),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: EMetrics.xlMargin),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: EMetrics.xlMargin),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -EMetrics.xlMargin),
            
            reloadButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: EMetrics.xxlMargin),
            reloadButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            reloadButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: EMetrics.xxlMargin),
            reloadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -EMetrics.xxlMargin),
            reloadButton.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight),
            reloadButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    // MARK: - Internal Functions
    
    func setupUI(message: String) {
        contentLabel.text = message
    }
}

