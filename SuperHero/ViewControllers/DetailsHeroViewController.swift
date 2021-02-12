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
    lazy var heroFullName = Labels.init().grayLabel
    lazy var heroImage = Images.init().roundedImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrappedHeroResult = heroResult else { return }
        title = unwrappedHeroResult.name
        view.backgroundColor = .white
        setupConstraints()
        populateData()
        
    }
    
    func setupConstraints() {
        view.addSubview(heroImage)
        view.addSubview(heroFullName)
        
        heroImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        heroImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heroImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        let imageViewHeightConstraint = heroImage.heightAnchor.constraint(equalToConstant: 160)
        imageViewHeightConstraint.priority = UILayoutPriority(rawValue: 999)
        imageViewHeightConstraint.isActive = true
        
        heroFullName.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 24).isActive = true
        heroFullName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    func populateData() {
        
        if let hero = heroResult {
            heroFullName.text = hero.biography.fullName.isEmpty ? "No full name available" : hero.biography.fullName
            let heroImageURL = URL(string: hero.image.url)
            heroImage.kf.setImage(with: heroImageURL)
        }
        
    }
    
}




