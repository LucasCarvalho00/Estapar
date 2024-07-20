//
//  HelpCenterDetailDataViewEntity.swift
//  Estapar
//
//  Created by Lucas on 20/07/24.
//

import UIKit

struct HelpCenterDetailDataViewEntity: Equatable {
    let titleScreen: String
    var topics: [HelpCenterDetailTopicsViewEntity]
}

struct HelpCenterDetailTopicsViewEntity: Equatable {
    let title: String
    var expanded: Bool
    let articles: [HelpCenterDetailArticlesViewEntity]
}

struct HelpCenterDetailArticlesViewEntity: Equatable {
    let title: String
    let id: String
}
