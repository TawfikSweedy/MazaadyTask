//
//  UIViewController+Ex.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 12/04/2025.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    func startLoading(){
        let backgroundView = UIView(frame: view.frame)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backgroundView.tag = 6006
        view.addSubview(backgroundView)
        
        let loaderSize: CGFloat = 50
        let activity = NVActivityIndicatorView(frame: CGRect(x: (view.frame.width/2) - (loaderSize/2), y: (view.frame.height/2) - (loaderSize/2), width: loaderSize, height: loaderSize), type: .ballRotateChase)
        activity.tag = 7007
        activity.color = .primary
        activity.startAnimating()
        backgroundView.addSubview(activity)
    }
    
    func stopLoading() {
        if let activity = view.viewWithTag(7007) as? NVActivityIndicatorView {
            activity.stopAnimating()
            activity.removeFromSuperview()
        }
        
        if let background = view.viewWithTag(6006) {
            background.removeFromSuperview()
        }
    }
    
    func alertError(title: String? = "Error", message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { Done in
            
        })

        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
}
