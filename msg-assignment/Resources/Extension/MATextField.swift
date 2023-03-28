//
//  MATextField.swift
//  msg-assignment
//
//  Created by 선민재 on 2023/03/28.
//

import Foundation
import UIKit

extension UITextField {
    func leftPadding(width: Float){
        let iconContainerView: UIView = UIView(
            frame:CGRect(
                x: 0,
                y: 0,
                width: CGFloat(width),
                height: 30
            )
        )
        leftView = iconContainerView
        leftViewMode = .always
    }
}
