//
//  EInformationCollectionViewCell.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

final class EInformationCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants

    private struct Metrics {
        static let borderWidth: CGFloat = 2.0
        static let borderRadius: CGFloat = 10.0
    }
    
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
    
    private lazy var borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBackground
        view.layer.borderWidth = Metrics.borderWidth
        view.layer.borderColor = UIColor.eBorder.cgColor
        view.layer.cornerRadius = Metrics.borderRadius
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .eDescription
        label.font = EFontStyle.description
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .eDescription200
        label.font = EFontStyle.description
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let image = UIImageView()
        image.image = .eIcCaretRight
        image.tintColor = .ePrimary
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var stackContentView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = EMetrics.smallMargin
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    // MARK: - Setup

    private func constraintUI() {
        contentView.addSubview(borderView)
        borderView.addSubview(titleLabel)
        borderView.addSubview(stackContentView)
        stackContentView.addArrangedSubview(descriptionLabel)
        stackContentView.addArrangedSubview(arrowImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            borderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: borderView.topAnchor, constant: EMetrics.largeMargin),
            titleLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: EMetrics.largeMargin),
            titleLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -EMetrics.largeMargin),

            stackContentView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -EMetrics.largeMargin),
            stackContentView.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: EMetrics.largeMargin),
            stackContentView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -EMetrics.largeMargin)
        ])
    }
    
    // MARK: - Internal Functions
    
    func setupUI(data: EInformationCollectionViewEntity) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
}
