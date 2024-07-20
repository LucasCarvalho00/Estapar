//
//  Extension+UITextField.swift
//  Estapar
//
//  Created by Lucas on 20/07/24.
//

import UIKit

extension UITextField {
    func setLeftView(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        iconView.image = image
          iconView.contentMode = .scaleAspectFit
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 40))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
        self.tintColor = .ePrimary
    }
}
