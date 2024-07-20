//
//  HelpCenterDetailViewModel.swift
//  Estapar
//
//  Created by Lucas on 20/07/24.
//

import Foundation
import UIKit

class HelpCenterDetailViewModel {
    
    // MARK: - Internal Attributes
    
    weak var viewController: HelpCenterDetailViewControllerProtocol?
    
    // MARK: - Private Attributes
    
    private let id: String
    private let helpCenterCategoriesByIDUseCaseProtocol: HelpCenterCategoriesByIDUseCaseProtocol

    // MARK: - Setup

    init(
        id: String,
        helpCenterCategoriesByIDUseCaseProtocol: HelpCenterCategoriesByIDUseCaseProtocol
    ) {
        self.id = id
        self.helpCenterCategoriesByIDUseCaseProtocol = helpCenterCategoriesByIDUseCaseProtocol
    }
    
    // MARK: Private Functions
    
    private func initScreen() {
        viewController?.setupUI(with: .hasLoading)
        callService()
    }
    
    private func callService() {
        helpCenterCategoriesByIDUseCaseProtocol.getHelpCenterCategoriesByIDUseCaseProtocol(id: id) { [weak self] result in
            switch result {
            case let .success(response):
                self?.makeEntity(response: response)
                break
            case .failure:
                self?.viewController?.setupUI(with: .hasError)
                break
            }
        }
    }
    
    private func makeEntity(response: HelpCenterCategoriesByIDUseCaseResponse) {
        var topicsArray: [HelpCenterDetailTopicsViewEntity] = []
        
        response.items.forEach { topics in
            var articlesArray: [HelpCenterDetailArticlesViewEntity] = []
            
            topics.items.forEach { articles in
                articlesArray.append(
                    HelpCenterDetailArticlesViewEntity(title: articles.title, id: articles.id)
                )
            }
            
            topicsArray.append(
                HelpCenterDetailTopicsViewEntity(title: topics.title, expanded: false, articles: articlesArray)
            )
        }
        
        viewController?.setupUI(with: .hasData(
            HelpCenterDetailDataViewEntity(titleScreen: response.title, topics: topicsArray)
        ))
    }
}

// MARK: - Extensions

extension HelpCenterDetailViewModel: HelpCenterDetailViewModelProtocol {
    func initState() {
        initScreen()
    }
}
