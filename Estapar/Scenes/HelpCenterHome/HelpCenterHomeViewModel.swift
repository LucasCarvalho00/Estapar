//
//  HelpCenterHomeViewModel.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import Foundation
import UIKit

class HelpCenterHomeViewModel {
    
    // MARK: - Constants

    private struct Constants {
        static let userSessionName = "Lucas"
        static let flagUserReplace = "%firstName%"
        static let articles: String = NSLocalizedString(" artigos", comment: "")
    }
    
    // MARK: - Internal Attributes
    
    weak var viewController: HelpCenterHomeViewControllerProtocol?
    
    // MARK: - Private Attributes
    
    private let helpCenterCategoriesUseCaseProtocol: HelpCenterCategoriesUseCaseProtocol
    private let imageByURLUseCaseProtocol: ImageByURLUseCaseProtocol

    // MARK: - Setup

    init(
        helpCenterCategoriesUseCaseProtocol: HelpCenterCategoriesUseCaseProtocol,
        imageByURLUseCaseProtocol: ImageByURLUseCaseProtocol
    ) {
        self.helpCenterCategoriesUseCaseProtocol = helpCenterCategoriesUseCaseProtocol
        self.imageByURLUseCaseProtocol = imageByURLUseCaseProtocol
    }
    
    // MARK: Private Functions
    
    private func initScreen() {
        viewController?.setupUI(with: .hasLoading)
        callService()
    }
    
    private func callService() {
        helpCenterCategoriesUseCaseProtocol.getHelpCenterCategoriesUseCaseProtocol { [weak self] result in
            switch result {
            case let .success(response):
                self?.getImage(data: response)
                break
            case .failure:
                self?.viewController?.setupUI(with: .hasError)
                break
            }
        }
    }
    
    private func getImage(data: HelpCenterCategoriesUseCaseResponse) {
        imageByURLUseCaseProtocol.getImage(url: data.header.image.imageOneThree) { [weak self] result in
            switch result {
            case let .success(response):
                self?.makeEntity(response: data, bannerImage: response.image)
                break
            case .failure:
                self?.viewController?.setupUI(with: .hasError)
                break
            }
        }
    }
    
    private func makeEntity(response: HelpCenterCategoriesUseCaseResponse, bannerImage: UIImage) {
        var items: [HelpCenterHomeItemsViewEntity] = []
        
        response.items.forEach { item in
            items.append(HelpCenterHomeItemsViewEntity(
                id: item.id, 
                title: item.title,
                description: String(item.totalArticles) + Constants.articles)
            )
        }
        
        let entity = HelpCenterHomeDataViewEntity(
            title: response.header.line1.replacingOccurrences(of: Constants.flagUserReplace, with: Constants.userSessionName),
            description: response.header.line2, 
            bannerImage: bannerImage,
            items: items)
        
        viewController?.setupUI(with: .hasData(entity))
    }
}

// MARK: - Extensions

extension HelpCenterHomeViewModel: HelpCenterHomeViewModelProtocol {
    func initState() {
        initScreen()
    }
}
