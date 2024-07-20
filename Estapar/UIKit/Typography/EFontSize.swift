//
//  EFontSize.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

enum EFontSize {
    case small
    case medium
    case large

    var size: CGFloat {
        switch self {
        case .small:
            return 14
        case .medium:
            return 16
        case .large:
            return 24
        }
    }
}
