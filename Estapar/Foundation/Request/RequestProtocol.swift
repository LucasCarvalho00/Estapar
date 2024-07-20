//
//  RequestProtocol.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var requestMock: String? { get }
}
