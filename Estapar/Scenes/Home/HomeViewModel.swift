//
//  HomeViewModel.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

class HomeViewModel {
    
    // MARK: - Internal Attributes
    
    weak var viewController: HomeViewControllerProtocol?
    
}

// MARK: - Extensions

extension HomeViewModel: HomeViewModelProtocol {
    func initState() { }
}
