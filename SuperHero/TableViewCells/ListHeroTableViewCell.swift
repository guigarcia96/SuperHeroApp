//
//  ListHeroTableViewCell.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 29/01/21.
//

import UIKit

class ListHeroTableViewCell: UITableViewCell {
    
    lazy var listImageView = Images.init().tableViewCellImage
    
    lazy var heroNameLabel = Labels.init().tableViewHeroNameLabel
    
    lazy var heroRealNameLabel = Labels.init().tableViewHeroFullNameLabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addInContentView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        listImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        listImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        listImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        listImageView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        let imageViewHeightConstraint = listImageView.heightAnchor.constraint(equalToConstant: 56)
        imageViewHeightConstraint.priority = UILayoutPriority(rawValue: 999)
        imageViewHeightConstraint.isActive = true
        
        heroNameLabel.topAnchor.constraint(equalTo: listImageView.topAnchor).isActive = true
        heroNameLabel.leadingAnchor.constraint(equalTo: listImageView.trailingAnchor, constant: 8).isActive = true
        
        heroRealNameLabel.topAnchor.constraint(equalTo: heroNameLabel.bottomAnchor, constant: 4).isActive = true
        heroRealNameLabel.leadingAnchor.constraint(equalTo: listImageView.trailingAnchor, constant: 8).isActive = true
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        heroNameLabel.text = nil
        heroRealNameLabel.text = nil
        listImageView.image = nil
        
    }
    
    func addInContentView() {
        contentView.addSubview(listImageView)
        contentView.addSubview(heroNameLabel)
        contentView.addSubview(heroRealNameLabel)
    }
    

}
