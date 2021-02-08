//
//  HeroPowerStatsCollectionViewCell.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 02/02/21.
//

import UIKit

class HeroPowerStatsCollectionViewCell: UICollectionViewCell {
    
    lazy var titleLabel:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = .red
        title.textColor = .white
        title.text = "Batata"
        title.textAlignment = .center
        title.layer.cornerRadius = 6
        title.layer.masksToBounds = true
        
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabel() {
        contentView.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        let titleLableWidthConstraint = titleLabel.widthAnchor.constraint(equalToConstant: 100)
        titleLableWidthConstraint.priority = UILayoutPriority(rawValue: 750)
        titleLableWidthConstraint.isActive = true
        let titleLableHeightConstraint = titleLabel.heightAnchor.constraint(equalToConstant: 60)
        titleLableHeightConstraint.priority = UILayoutPriority(rawValue: 750)
        titleLableHeightConstraint.isActive = true
        
        
    }
    
}
