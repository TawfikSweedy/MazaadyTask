//
//  Font+Ex.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 10/04/2025.
//

import Foundation
import UIKit

protocol FontApplicable {
    func setFont(name: String, size: CGFloat)
}

extension UIView {
    
    @IBInspectable
    var NunitoExtraBold: CGFloat {
        set {
            (self as? FontApplicable)?.setFont(name: "Nunito-ExtraBold", size: newValue)
        }
        get {
            return 0.0
        }
    }

    @IBInspectable
    var NunitoBold: CGFloat {
        set {
            (self as? FontApplicable)?.setFont(name: "Nunito-Bold", size: newValue)
        }
        get {
            return 0.0
        }
    }

    @IBInspectable
    var NunitoBlack: CGFloat {
        set {
            (self as? FontApplicable)?.setFont(name: "Nunito-Black", size: newValue)
        }
        get {
            return 0.0
        }
    }

    @IBInspectable
    var NunitoMedium: CGFloat {
        set {
            (self as? FontApplicable)?.setFont(name: "Nunito-Medium", size: newValue)
        }
        get {
            return 0.0
        }
    }

    @IBInspectable
    var NunitoRegular: CGFloat {
        set {
            (self as? FontApplicable)?.setFont(name: "Nunito-Regular", size: newValue)
        }
        get {
            return 0.0
        }
    }

    @IBInspectable
    var NunitoSemiBold: CGFloat {
        set {
            (self as? FontApplicable)?.setFont(name: "Nunito-SemiBold", size: newValue)
        }
        get {
            return 0.0
        }
    }

    @IBInspectable
    var NunitoLight: CGFloat {
        set {
            (self as? FontApplicable)?.setFont(name: "Nunito-Light", size: newValue)
        }
        get {
            return 0.0
        }
    }

    @IBInspectable
    var NunitoExtraLight: CGFloat {
        set {
            (self as? FontApplicable)?.setFont(name: "Nunito-ExtraLight", size: newValue)
        }
        get {
            return 0.0
        }
    }
}
