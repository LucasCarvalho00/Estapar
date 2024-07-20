//
//  ECollapseTableHeaderView.swift
//  Estapar
//
//  Created by Lucas on 20/07/24.
//

import UIKit

final class ECollapseTableHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Constants

    private struct Metrics {
        static let borderWidth: CGFloat = 2.0
        static let borderRadius: CGFloat = 10.0
        static let arrownImageSize: CGFloat = 16.0
    }
    
    // MARK: - Life Cyle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        constraintUI()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
        label.textColor = .ePrimary
        label.font = EFontStyle.description
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrownImageView: UIImageView = {
        let image = UIImageView()
        image.image = .eIcArrownDown
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
         
            titleLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: EMetrics.largeMargin),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: borderView.trailingAnchor, constant: -EMetrics.largeMargin),
            titleLabel.centerYAnchor.constraint(equalTo: borderView.centerYAnchor)
        ])
    }
    
    // MARK: - Internal Functions
    
    func setupUI(title: String, expanded: Bool, filtered: Bool) {
        titleLabel.text = title
        arrownImageView.image = expanded ? .eIcArrownUp : .eIcArrownDown
        arrownImageView.isHidden = filtered
    }
}
