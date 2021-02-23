//
//  Images.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 12/02/21.
//

import Foundation
import UIKit


class Images {
    
    lazy var roundedImage:UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 160, height: 160))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.setRounded()
        return image
    }()
    
    lazy var tableViewCellImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
        }()
    
}

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }
}

