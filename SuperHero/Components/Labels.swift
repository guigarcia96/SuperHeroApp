//
//  Labels.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 12/02/21.
//

import Foundation
import UIKit

class Labels {
    
    var grayLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        return label
    }()
    
    lazy var homeScreenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type your favorite super-hero name"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var tableViewHeroNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Herói"
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var tableViewHeroFullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome real do herói"
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.textColor = .systemGray2
        return label
    }()
    
    
}
