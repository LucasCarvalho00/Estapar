//
//  HelpCenterDetailDataView.swift
//  Estapar
//
//  Created by Lucas on 20/07/24.
//

import UIKit

final class HelpCenterDetailDataView: UIView {
    
    // MARK: - Constants

    private struct Metrics {
        static let borderRadius: CGFloat = 16.0
        static let returnImageSize: CGFloat = 25.0
        static let heightHeaderTableView: CGFloat = 45.0
        static let heightSearchTextField: CGFloat = 50.0
    }
    
    private struct Constants {
        static let subtitleScreen: String = NSLocalizedString("Perguntas frequentes", comment: "")
    }
    
    // MARK: - Private Properties

    var entity: HelpCenterDetailDataViewEntity?
    var filtredEntity:  [HelpCenterDetailTopicsViewEntity] = []
    var filtred: Bool = false
    
    // MARK: - Delegates
    
    weak var delegate: HelpCenterDetailDataViewDelegate?
    
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
        label.font = EFontStyle.screenTitle
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var returnImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = .eIcIconLeft
        image.tintColor = .eBackground
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.goToHelpCenterHomeViewController)))
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = Metrics.borderRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var screenSubtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .eDescription
        label.font = EFontStyle.description
        label.text = Constants.subtitleScreen
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var searchTextField: ESearchTextField = {
        let search = ESearchTextField()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.delegate = self
        search.clearButtonMode = .never
        return search
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = nil
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(ECollapseTableHeaderView.self, forHeaderFooterViewReuseIdentifier: ECollapseTableHeaderView.className)
        tableView.register(ECollapseTableTableViewCell.self, forCellReuseIdentifier: ECollapseTableTableViewCell.className)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .background
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Actions

    @objc func goToHelpCenterHomeViewController() {
        delegate?.goToHelpCenterHomeViewController()
    }
                                   
    // MARK: - Setup

    private func constraintUI() {
        addSubview(returnImageView)
        addSubview(screenTitleLabel)
        addSubview(contentView)
        contentView.addSubview(screenSubtitleLabel)
        contentView.addSubview(searchTextField)
        contentView.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            screenTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: EMetrics.xlMargin),
            screenTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            returnImageView.topAnchor.constraint(equalTo: topAnchor, constant: EMetrics.mediumMargin),
            returnImageView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -EMetrics.mediumMargin),
            returnImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: EMetrics.xlMargin),
            returnImageView.heightAnchor.constraint(equalToConstant: Metrics.returnImageSize),
            returnImageView.widthAnchor.constraint(equalToConstant: Metrics.returnImageSize),

            contentView.topAnchor.constraint(equalTo: screenTitleLabel.bottomAnchor, constant: EMetrics.largeMargin),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            screenSubtitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: EMetrics.xlMargin),
            screenSubtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: EMetrics.largeMargin),
            screenSubtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -EMetrics.largeMargin),
            
            searchTextField.topAnchor.constraint(equalTo: screenSubtitleLabel.bottomAnchor, constant: EMetrics.largeMargin),
            searchTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: EMetrics.largeMargin),
            searchTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -EMetrics.largeMargin),
            searchTextField.heightAnchor.constraint(equalToConstant: Metrics.heightSearchTextField),
            
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: EMetrics.mediumMargin),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -EMetrics.largeMargin),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: EMetrics.largeMargin),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -EMetrics.largeMargin),
        ])
    }
    
    // MARK: - Internal Functions
    
    func setupData(data: HelpCenterDetailDataViewEntity) {
        entity = data
        filtredEntity = data.topics
        screenTitleLabel.text = data.titleScreen
        tableView.reloadData()
    }
}

// MARK: - Extensions

extension HelpCenterDetailDataView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchTextField.textFieldDidBeginEditing()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.textFieldDidEndEditing()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text as NSString? else {
            filtred = false
            tableView.reloadData()
            return true
        }
        
        guard let entity else {
            filtred = false
            tableView.reloadData()
            return true
        }

        let updatedText = currentText.replacingCharacters(in: range, with: string)
        
        if updatedText.count == 0 {
            filtred = false
            filtredEntity = entity.topics
            tableView.reloadData()
            return true
        }
        
        var newFilteredEntity: [HelpCenterDetailTopicsViewEntity] = []
        
        entity.topics.forEach { topics in
            let filteredArticles = topics.articles.filter { articles in
                articles.title.lowercased().contains(updatedText.lowercased())
            }
            
            if filteredArticles.count > 0 {
                newFilteredEntity.append(HelpCenterDetailTopicsViewEntity(title: topics.title, expanded: true, articles: filteredArticles))
            }
        }
        
        filtredEntity = newFilteredEntity
        filtred = true
        tableView.reloadData()
        return true
    }
}

extension HelpCenterDetailDataView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Metrics.heightHeaderTableView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ECollapseTableHeaderView.className) as? ECollapseTableHeaderView else { return UITableViewCell() }
        headerView.setupUI(title: filtredEntity[section].title, expanded: filtredEntity[section].expanded, filtered: filtred)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerViewTap(_:)))
        headerView.tag = section
        headerView.addGestureRecognizer(tapGesture)
        
        return headerView
    }
    
    @objc func headerViewTap(_ gesture: UITapGestureRecognizer) {
        guard let section = gesture.view?.tag else { return }
        filtredEntity[section].expanded.toggle()
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        endEditing(true)
    }
}

extension HelpCenterDetailDataView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return filtredEntity.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtredEntity[section].expanded || filtred ? filtredEntity[section].articles.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ECollapseTableTableViewCell.className, for: indexPath) as? ECollapseTableTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setupUI(title: filtredEntity[indexPath.section].articles[indexPath.row].title, lastItem: false)
        return cell
    }
}
