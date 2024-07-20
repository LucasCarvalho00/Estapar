//
//  HelpCenterCategoriesUseCaseResponse.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

struct HelpCenterCategoriesUseCaseResponse: Decodable {
    let header: HelpCenterCategoriesUseCaseHeaderResponse
    let items: [HelpCenterCategoriesUseCaseItemsResponse]
}

struct HelpCenterCategoriesUseCaseHeaderResponse: Decodable {
    let image: HelpCenterCategoriesUseCaseHeaderImageResponse
    let line1: String
    let line2: String
}

struct HelpCenterCategoriesUseCaseHeaderImageResponse: Decodable {
    let imageOne: String
    let imageOneTwo: String
    let imageOneThree: String
    
    enum CodingKeys: String, CodingKey {
        case imageOne = "@1x"
        case imageOneTwo = "@2x"
        case imageOneThree = "@3x"
    }
}

struct HelpCenterCategoriesUseCaseItemsResponse: Decodable {
    let id: String
    let title: String
    let category: String?
    let totalArticles: Int
}
