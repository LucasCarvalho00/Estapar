//
//  EFontStyle.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import UIKit

struct EFontStyle {
    
    /// Font System with size 24
    static let title = UIFont.boldSystemFont(ofSize: EFontSize.large.size)
    
    /// Font System with size 16
    static let screenTitle = UIFont.boldSystemFont(ofSize: EFontSize.medium.size)

    /// Font System with size 14
    static let description = UIFont.boldSystemFont(ofSize: EFontSize.small.size)
}
