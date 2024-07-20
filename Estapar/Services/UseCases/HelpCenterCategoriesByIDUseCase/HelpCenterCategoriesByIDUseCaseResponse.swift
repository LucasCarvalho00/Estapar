//
//  HelpCenterCategoriesByIDUseCaseResponse.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

struct HelpCenterCategoriesByIDUseCaseResponse: Decodable {
    let id: String
    let title: String
    let type: String
    let category: String?
    let header: HelpCenterCategoriesByIDUseCaseHeaderResponse
    let items: [HelpCenterCategoriesByIDUseCaseItemsResponse]
}

struct HelpCenterCategoriesByIDUseCaseHeaderResponse: Decodable {
    let image: HelpCenterCategoriesByIDUseCaseHeaderImageResponse
    let line1: String
    let line2: String
}

struct HelpCenterCategoriesByIDUseCaseHeaderImageResponse: Decodable {
    let imageOne: String
    let imageOneTwo: String
    let imageOneThree: String
    
    enum CodingKeys: String, CodingKey {
        case imageOne = "@1x"
        case imageOneTwo = "@2x"
        case imageOneThree = "@3x"
    }
}

struct HelpCenterCategoriesByIDUseCaseItemsResponse: Decodable {
    let id: String
    let title: String
    let type: String
    let items: [HelpCenterCategoriesByIDUseCaseItemsDetailResponse]
}

struct HelpCenterCategoriesByIDUseCaseItemsDetailResponse: Decodable {
    let id: String
    let title: String
    let type: String
}
