//
//  Extension+NSObject.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import Foundation

extension NSObject {
    static var className: String {
        return NSStringFromClass(self)
            .components(separatedBy: ".")
            .last ?? NSStringFromClass(self)
    }
}
