//
//  HelpCenterRequests.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import Foundation

enum HelpCenterRequests: RequestProtocol {
        
    // MARK: - Case
    
    case getCategories
    case getCategoriesByID(id: String)
    
    // MARK: - Properties

    var path: String {
        switch self {
        case .getCategories:
            return "helpcenter/categories"
        case let .getCategoriesByID(id):
            return "helpcenter/categories/" + id
        }
    }
    
    var method: RequestMethod {
        return .GET
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var requestMock: String? {
        return nil
    }
}
