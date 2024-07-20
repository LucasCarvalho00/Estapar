//
//  HelpCenterHomeDataViewEntity.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

struct HelpCenterHomeDataViewEntity: Equatable {
    let title: String
    let description: String
    let bannerImage: UIImage
    let items: [HelpCenterHomeItemsViewEntity]
}

struct HelpCenterHomeItemsViewEntity: Equatable {
    let id: String
    let title: String
    let description: String
}
