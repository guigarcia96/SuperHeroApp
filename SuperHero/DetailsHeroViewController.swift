//
//  DetailsHeroViewController.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 02/02/21.
//

import UIKit

class DetailsHeroViewController: UIViewController {
    
    var heroResult:Result?
    var powerstats = [String]()
    
    lazy var listImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var heroNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Herói"
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrappedHeroResult = heroResult else { return }
        title = unwrappedHeroResult.name
        view.backgroundColor = .white
        setupConstraints()
        populateData()
        
    }
    
    
    func setupConstraints() {
        view.addSubview(listImageView)
        view.addSubview(heroNameLabel)
       
        //need to rewrite the constraints to refact the layout
        
        listImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        listImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        listImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        let imageViewHeightConstraint = listImageView.heightAnchor.constraint(equalToConstant: 150)
        imageViewHeightConstraint.priority = UILayoutPriority(rawValue: 750)
        imageViewHeightConstraint.isActive = true
        
        heroNameLabel.topAnchor.constraint(equalTo: listImageView.topAnchor).isActive = true
        heroNameLabel.leadingAnchor.constraint(equalTo: listImageView.trailingAnchor, constant: 16).isActive = true
        
        
    }
    
    func populateData() {
        guard let unwrappedHeroResult = heroResult else { return }
        heroNameLabel.text = unwrappedHeroResult.name
        let heroImage = URL(string: unwrappedHeroResult.image.url)
        listImageView.kf.setImage(with: heroImage)
    }
    
}
