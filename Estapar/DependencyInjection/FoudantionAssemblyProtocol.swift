//
//  FoudantionAssemblyProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

protocol FoundationAssemblyProtocol {
    func makeFlowController(scenesFactoryProtocol: ScenesFactoryProtocol, navigationController: UINavigationController) -> FlowController
    func makeNetworkOperationProtocol() -> NetworkOperationProtocol
    func makeImageByURLUseCaseProtocol() -> ImageByURLUseCaseProtocol
}
