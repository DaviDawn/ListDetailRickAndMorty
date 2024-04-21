//
//  UIImageView+Extension.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 20/4/24.
//

import UIKit
import SDWebImage

extension UIImageView {
    func loadImage(with imageURL: String) {
        self.sd_setImage(with: URL(string: imageURL))
    }
}
