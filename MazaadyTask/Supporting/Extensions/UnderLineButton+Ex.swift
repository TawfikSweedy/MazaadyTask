//
//  UnderLineButton+Ex.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 10/04/2025.
//

import Foundation
import UIKit

@IBDesignable
class UnderlineButton: UIButton {

    private let underline = UIView()
    
    @IBInspectable var activeUnderlineColor: UIColor = .systemBlue
    @IBInspectable var inactiveUnderlineColor: UIColor = .lightGray
    @IBInspectable var underlineHeight: CGFloat = 2.0

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUnderline()
    }

    private func setupUnderline() {
        underline.translatesAutoresizingMaskIntoConstraints = false
        addSubview(underline)
        NSLayoutConstraint.activate([
            underline.heightAnchor.constraint(equalToConstant: underlineHeight),
            underline.leadingAnchor.constraint(equalTo: leadingAnchor),
            underline.trailingAnchor.constraint(equalTo: trailingAnchor),
            underline.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        underline.backgroundColor = inactiveUnderlineColor
    }

    func setUnderlineActive(_ isActive: Bool) {
        underline.backgroundColor = isActive ? activeUnderlineColor : inactiveUnderlineColor
        if isActive == true {
            self.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 14)
            self.setTitleColor(.primary, for: .normal)
        }else{
            self.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 14)
            self.setTitleColor(.grey, for: .normal)
        }
    }
}
