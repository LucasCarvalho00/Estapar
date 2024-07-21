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
        static let heightDividerView: CGFloat = 8.0
        static let borderRadius: CGFloat = 8.0
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
    
    private lazy var contentDividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .background
        view.isHidden = true
        return view
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBorder
        return view
    }()
    
    private lazy var leftBorderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBorder
        return view
    }()
    
    private lazy var rightBorderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBorder
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
        contentView.addSubview(contentDividerView)
        contentDividerView.addSubview(dividerView)
        contentDividerView.addSubview(leftBorderView)
        contentDividerView.addSubview(rightBorderView)
        borderView.addSubview(titleLabel)
        borderView.addSubview(arrownImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            borderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            contentDividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentDividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentDividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentDividerView.heightAnchor.constraint(equalToConstant: Metrics.heightDividerView),
            
            dividerView.leadingAnchor.constraint(equalTo: contentDividerView.leadingAnchor, constant: EMetrics.largeMargin),
            dividerView.trailingAnchor.constraint(equalTo: contentDividerView.trailingAnchor, constant: -EMetrics.largeMargin),
            dividerView.bottomAnchor.constraint(equalTo: contentDividerView.bottomAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: Metrics.borderWidth),
            
            leftBorderView.leadingAnchor.constraint(equalTo: contentDividerView.leadingAnchor),
            leftBorderView.topAnchor.constraint(equalTo: contentDividerView.topAnchor),
            leftBorderView.bottomAnchor.constraint(equalTo: contentDividerView.bottomAnchor),
            leftBorderView.widthAnchor.constraint(equalToConstant: Metrics.borderWidth),
            
            rightBorderView.rightAnchor.constraint(equalTo: contentDividerView.rightAnchor),
            rightBorderView.topAnchor.constraint(equalTo: contentDividerView.topAnchor),
            rightBorderView.bottomAnchor.constraint(equalTo: contentDividerView.bottomAnchor),
            rightBorderView.widthAnchor.constraint(equalToConstant: Metrics.borderWidth),
            
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
        contentDividerView.isHidden = filtered || expanded ? false : true
        arrownImageView.isHidden = filtered
    }

}
