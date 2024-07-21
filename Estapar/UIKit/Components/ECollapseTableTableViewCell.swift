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
        static let dividerHeight: CGFloat = 8.0
        static let borderRadius: CGFloat = 10.0
        static let arrownImageSize: CGFloat = 16.0
    }
    
    // MARK: - Private Properties

    private var rightBottomConstraint: NSLayoutConstraint?
    private var leftBottomConstraint: NSLayoutConstraint?

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
        view.layer.borderWidth = Metrics.borderWidth
        view.layer.borderColor = UIColor.eBorder.cgColor
        view.layer.cornerRadius = Metrics.borderRadius
        return view
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBackground
        return view
    }()
    
    private lazy var bottomDividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBackground
        return view
    }()
    
    private lazy var contentDividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBackground
        view.isHidden = true
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
    
    private lazy var bottomLeftBorderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBorder
        return view
    }()
    
    private lazy var bottomRightBorderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .eBorder
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
        contentView.addSubview(dividerView)
        contentView.addSubview(bottomDividerView)
        contentView.addSubview(leftBorderView)
        contentView.addSubview(rightBorderView)
        contentView.addSubview(bottomLeftBorderView)
        contentView.addSubview(bottomRightBorderView)
        borderView.addSubview(titleLabel)
        borderView.addSubview(arrownImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            borderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            dividerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: Metrics.dividerHeight),

            bottomDividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomDividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomDividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomDividerView.heightAnchor.constraint(equalToConstant: Metrics.dividerHeight),
            
            leftBorderView.leadingAnchor.constraint(equalTo: dividerView.leadingAnchor),
            leftBorderView.topAnchor.constraint(equalTo: dividerView.topAnchor),
            leftBorderView.bottomAnchor.constraint(equalTo: dividerView.bottomAnchor),
            leftBorderView.widthAnchor.constraint(equalToConstant: Metrics.borderWidth),
            
            rightBorderView.rightAnchor.constraint(equalTo: dividerView.rightAnchor),
            rightBorderView.topAnchor.constraint(equalTo: dividerView.topAnchor),
            rightBorderView.bottomAnchor.constraint(equalTo: dividerView.bottomAnchor),
            rightBorderView.widthAnchor.constraint(equalToConstant: Metrics.borderWidth),
            
            bottomLeftBorderView.leadingAnchor.constraint(equalTo: bottomDividerView.leadingAnchor),
            bottomLeftBorderView.topAnchor.constraint(equalTo: bottomDividerView.topAnchor),
            bottomLeftBorderView.bottomAnchor.constraint(equalTo: bottomDividerView.bottomAnchor),
            bottomLeftBorderView.widthAnchor.constraint(equalToConstant: Metrics.borderWidth),
            
            bottomRightBorderView.rightAnchor.constraint(equalTo: bottomDividerView.rightAnchor),
            bottomRightBorderView.topAnchor.constraint(equalTo: bottomDividerView.topAnchor),
            bottomRightBorderView.bottomAnchor.constraint(equalTo: bottomDividerView.bottomAnchor),
            bottomRightBorderView.widthAnchor.constraint(equalToConstant: Metrics.borderWidth),
            
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
        bottomDividerView.isHidden = lastItem
        bottomLeftBorderView.isHidden = lastItem
        bottomRightBorderView.isHidden = lastItem
    }
}
