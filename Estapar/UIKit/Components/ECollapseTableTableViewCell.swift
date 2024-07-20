//
//  ECollapseTableTableViewCell.swift
//  Estapar
//
//  Created by Lucas on 20/07/24.
//

import UIKit

final class ECollapseTableTableViewCell: UITableViewCell {
    
    // MARK: - Constants

    private struct Metrics {
        static let borderWidth: CGFloat = 2.0
        static let borderRadius: CGFloat = 10.0
        static let arrownImageSize: CGFloat = 16.0
    }
    
    // MARK: - Life Cyle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    private lazy var arrownImageView: UIImageView = {
        let image = UIImageView()
        image.image = .eIcCaretRight
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Setup

    private func constraintUI() {
        contentView.addSubview(borderView)
        borderView.addSubview(titleLabel)
        borderView.addSubview(arrownImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            borderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            arrownImageView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -EMetrics.largeMargin),
            arrownImageView.heightAnchor.constraint(equalToConstant: Metrics.arrownImageSize),
            arrownImageView.widthAnchor.constraint(equalToConstant: Metrics.arrownImageSize),
            arrownImageView.centerYAnchor.constraint(equalTo: borderView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: borderView.topAnchor, constant: EMetrics.largeMargin),
            titleLabel.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -EMetrics.largeMargin),
            titleLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: EMetrics.largeMargin),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: arrownImageView.leadingAnchor, constant: -EMetrics.largeMargin),
        ])
    }
    
    // MARK: - Internal Functions
    
    func setupUI(title: String, lastItem: Bool) {
        titleLabel.text = title
    }
}

