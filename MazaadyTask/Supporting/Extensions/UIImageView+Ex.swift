//
//  UIImageView+Ex.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 12/04/2025.
//

import Foundation
import SDWebImage

extension UIImageView{
    func SDImage(_ url : URL?) {
        
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: url, placeholderImage: nil ,options: SDWebImageOptions(rawValue: 0), completed: { (img, err, cacheType, imgURL) in
        })
    }
}

