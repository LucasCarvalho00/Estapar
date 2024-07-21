//
//  HelpCenterHomeDataView.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

final class HelpCenterHomeDataView: UIView {
    
    // MARK: - Constants

    private struct Constants {
        static let screenTitleText: String = NSLocalizedString("Central de ajuda", comment: "")
    }
    
    private struct Metrics {
        static let animationScroll: CGFloat = 0.25
        static let borderRadius: CGFloat = 16.0
        static let maxScrollOffset: CGFloat = 80.0
        static let minimumHeaderHeight: CGFloat = 100.0
        static let maxHeaderHeight: CGFloat = 180.0
    }
    
    // MARK: - Private Properties

    private var entity: HelpCenterHomeDataViewEntity?
    private var heightHeaderConstraint: NSLayoutConstraint?

    // MARK: - Delegates
    
    weak var delegate: HelpCenterHomeDataViewDelegate?
    
    // MARK: - Life Cyle

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
        backgroundColor = .ePrimary
    }
    
    // MARK: - UI
    
    private lazy var screenTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .background
        label.text = Constants.screenTitleText
        label.font = EFontStyle.screenTitle
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = Metrics.borderRadius
        return view
    }()
    
    private lazy var headerImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .ePrimary200
        label.font = EFontStyle.title
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var headerInformationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .eBackground
        label.font = EFontStyle.title
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = EMetrics.xlMargin
        layout.minimumLineSpacing = EMetrics.xlMargin
        layout.collectionView?.delegate = self
        let collection = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collection.register(EInformationCollectionViewCell.self, forCellWithReuseIdentifier: EInformationCollectionViewCell.className)
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    // MARK: - Setup

    private func constraintUI() {
        addSubview(screenTitleLabel)
        addSubview(headerImageView)
        headerImageView.addSubview(headerTitleLabel)
        headerImageView.addSubview(headerInformationLabel)
        addSubview(contentView)
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            screenTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: EMetrics.xlMargin),
            screenTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            headerImageView.topAnchor.constraint(equalTo: screenTitleLabel.bottomAnchor, constant: EMetrics.largeMargin),
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            headerInformationLabel.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor, constant: EMetrics.largeMargin),
            headerInformationLabel.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: -EMetrics.largeMargin),
            headerInformationLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -EMetrics.tinyMargin),

            headerTitleLabel.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor, constant: EMetrics.largeMargin),
            headerTitleLabel.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: -EMetrics.largeMargin),
            headerTitleLabel.bottomAnchor.constraint(equalTo: headerInformationLabel.topAnchor, constant: -EMetrics.tinyMargin),

            contentView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: EMetrics.largeMargin),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: EMetrics.xlMargin),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -EMetrics.xlMargin),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: EMetrics.xlMargin),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -EMetrics.xlMargin),
        ])
        
        heightHeaderConstraint = headerImageView.heightAnchor.constraint(equalToConstant: Metrics.maxHeaderHeight)
        heightHeaderConstraint?.isActive = true
    }
    
    // MARK: - Internal Functions
    
    func setupData(data: HelpCenterHomeDataViewEntity) {
        entity = data
        headerImageView.image = data.bannerImage
        headerTitleLabel.text = data.title
        headerInformationLabel.text = data.description
        collectionView.reloadData()
    }
}

// MARK: - Extensions

extension HelpCenterHomeDataView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = EMetrics.xlMargin
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/3)
    }
}

extension HelpCenterHomeDataView: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension HelpCenterHomeDataView: UICollectionViewDataSource {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var newHeight = 0.0

        switch scrollView.contentOffset.y {
        case 0...Metrics.maxScrollOffset:
            headerImageView.image = entity?.bannerImage
            newHeight = Metrics.maxHeaderHeight - scrollView.contentOffset.y
            break
        default:
            headerImageView.image = UIImage()
            newHeight = Metrics.minimumHeaderHeight
            break
        }
        
        UIView.animate(withDuration: Metrics.animationScroll, animations: { [weak self] in
            self?.heightHeaderConstraint?.constant = newHeight
            self?.layoutIfNeeded()
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let entity else {
            return
        }
        
        delegate?.goToHelpCenterDetailViewController(id: entity.items[indexPath.row].id)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let entity else {
            return 0
        }
        
        return entity.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EInformationCollectionViewCell.className, for: indexPath) as? EInformationCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let entity else {
            return UICollectionViewCell()
        }
        
        let data = entity.items[indexPath.row]
        cell.setupUI(data: EInformationCollectionViewEntity(id: data.id, title: data.title, description: data.description))
        cell.backgroundColor = .white
        return cell
    }
}

