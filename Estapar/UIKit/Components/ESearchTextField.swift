//
//  ESearchTextField.swift
//  Estapar
//
//  Created by Lucas on 20/07/24.
//

import UIKit

class ESearchTextField: UITextField {
    
    // MARK: - Constants
    
    private struct Constants {
        static let defaultPlaceholder: String = NSLocalizedString("Pesquisar", comment: "")
    }
    
    public struct Metrics {
        static let borderWidth: CGFloat = 2.0
        static let cornerRadius: CGFloat = 10.0
        static let imageSize: CGFloat = 24.0
    }
    
    // MARK: - Internal Attributes

    override var placeholder: String? {
        didSet {
            guard let placeholder = placeholder else { return }
            let placeHolderColorAttr = [
                NSAttributedString.Key.foregroundColor: UIColor.eDescription200,
                NSAttributedString.Key.font: EFontStyle.description
            ]
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeHolderColorAttr)
        }
    }
    
    // MARK: - Initializers

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    private func setup() {
        clearButtonMode = .always
        backgroundColor = .eBorder
        textColor = .eDescription
        font = EFontStyle.description
        placeholder = Constants.defaultPlaceholder
        layer.borderWidth = Metrics.borderWidth
        layer.borderColor = UIColor.eBorder.cgColor
        
        layer.masksToBounds = true
        layer.cornerRadius = Metrics.cornerRadius
        
        setLeftView(image: .eIcSearch)
    }
    
    // MARK: - Internal Functions

    func textFieldDidBeginEditing() {
        layer.borderColor = UIColor.ePrimary.cgColor
    }
    
    func textFieldDidEndEditing() {
        layer.borderColor = UIColor.eBorder.cgColor
    }
}
