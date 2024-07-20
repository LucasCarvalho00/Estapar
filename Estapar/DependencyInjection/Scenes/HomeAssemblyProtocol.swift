//
//  HomeAssemblyProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

protocol HomeAssemblyProtocol {
    func makeHomeViewController() -> HomeViewController
    func makeHomeViewModelProtocol() -> HomeViewModelProtocol
    func makeHomeViewProtocol() -> HomeViewProtocol
}
