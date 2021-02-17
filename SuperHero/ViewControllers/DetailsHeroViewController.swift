//
//  DetailsHeroViewController.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 02/02/21.
//

import UIKit

class DetailsHeroViewController: UIViewController {
    
    var heroResult:Result?
    lazy var heroFullName = Labels.init().grayLabel
    lazy var heroImage = Images.init().roundedImage
    lazy var combatLabel = Labels.init().commonLabel
    lazy var durabilytLabel = Labels.init().commonLabel
    lazy var inteligenceLabel = Labels.init().commonLabel
    lazy var powerLabel = Labels.init().commonLabel
    lazy var speedLabel = Labels.init().commonLabel
    lazy var strenghtLabel = Labels.init().commonLabel
    lazy var combatValueLabel = Labels.init().roundedLabel
    lazy var durabilityValueLabel = Labels.init().roundedLabel
    lazy var inteligenceValueLabel = Labels.init().roundedLabel
    lazy var powerValueLabel = Labels.init().roundedLabel
    lazy var strenghtValueLabel = Labels.init().roundedLabel
    lazy var speedValueLabel = Labels.init().roundedLabel
    
    
    lazy var powerStatsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let unwrappedHeroResult = heroResult else { return }
        title = unwrappedHeroResult.name
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        populateData()
        
    }
    
    func setupViews() {
        view.addSubview(heroImage)
        view.addSubview(heroFullName)
        view.addSubview(powerStatsView)
        powerStatsView.addSubview(combatLabel)
        powerStatsView.addSubview(combatValueLabel)
        powerStatsView.addSubview(durabilytLabel)
        powerStatsView.addSubview(durabilityValueLabel)
        powerStatsView.addSubview(inteligenceLabel)
        powerStatsView.addSubview(inteligenceValueLabel)
        powerStatsView.addSubview(powerLabel)
        powerStatsView.addSubview(powerValueLabel)
        powerStatsView.addSubview(speedLabel)
        powerStatsView.addSubview(speedValueLabel)
        powerStatsView.addSubview(strenghtLabel)
        powerStatsView.addSubview(strenghtValueLabel)
    }
    
    func setupConstraints() {
        
        heroImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        heroImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heroImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        let imageViewHeightConstraint = heroImage.heightAnchor.constraint(equalToConstant: 160)
        imageViewHeightConstraint.priority = UILayoutPriority(rawValue: 999)
        imageViewHeightConstraint.isActive = true
        
        heroFullName.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 24).isActive = true
        heroFullName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        powerStatsView.topAnchor.constraint(equalTo: heroFullName.bottomAnchor, constant: 48).isActive = true
        powerStatsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        powerStatsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        powerStatsView.heightAnchor.constraint(equalToConstant: 260).isActive = true
        
        
        combatLabel.topAnchor.constraint(equalTo: powerStatsView.topAnchor).isActive = true
        combatLabel.trailingAnchor.constraint(equalTo: durabilytLabel.leadingAnchor, constant: -54).isActive = true
        
        combatValueLabel.topAnchor.constraint(equalTo: combatLabel.bottomAnchor, constant: 16).isActive = true
        combatValueLabel.trailingAnchor.constraint(equalTo: durabilityValueLabel.leadingAnchor, constant: -82).isActive = true
        combatValueLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        combatValueLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        durabilytLabel.topAnchor.constraint(equalTo: powerStatsView.topAnchor).isActive = true
        durabilytLabel.centerXAnchor.constraint(equalTo: powerStatsView.centerXAnchor).isActive = true
        
        durabilityValueLabel.topAnchor.constraint(equalTo: durabilytLabel.bottomAnchor, constant: 16).isActive = true
        durabilityValueLabel.centerXAnchor.constraint(equalTo: powerStatsView.centerXAnchor).isActive = true
        durabilityValueLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        durabilityValueLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        inteligenceLabel.topAnchor.constraint(equalTo: powerStatsView.topAnchor).isActive = true
        inteligenceLabel.leadingAnchor.constraint(equalTo: durabilytLabel.trailingAnchor, constant: 36).isActive = true
        
        inteligenceValueLabel.topAnchor.constraint(equalTo: inteligenceLabel.bottomAnchor, constant: 16).isActive = true
        inteligenceValueLabel.leadingAnchor.constraint(equalTo: durabilityValueLabel.trailingAnchor, constant: 80).isActive = true
        inteligenceValueLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        inteligenceValueLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        powerLabel.topAnchor.constraint(equalTo: durabilityValueLabel.bottomAnchor, constant: 24).isActive = true
        powerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        powerValueLabel.topAnchor.constraint(equalTo: powerLabel.bottomAnchor, constant: 16).isActive = true
        powerValueLabel.centerXAnchor.constraint(equalTo: powerStatsView.centerXAnchor).isActive = true
        powerValueLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        powerValueLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        speedLabel.topAnchor.constraint(equalTo: powerLabel.topAnchor).isActive = true
        speedLabel.trailingAnchor.constraint(equalTo: powerLabel.leadingAnchor, constant: -74).isActive = true
        
        speedValueLabel.topAnchor.constraint(equalTo: speedLabel.bottomAnchor, constant: 16).isActive = true
        speedValueLabel.trailingAnchor.constraint(equalTo: powerValueLabel.leadingAnchor, constant: -82).isActive = true
        speedValueLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        speedValueLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        strenghtLabel.topAnchor.constraint(equalTo: powerLabel.topAnchor).isActive = true
        strenghtLabel.leadingAnchor.constraint(equalTo: powerLabel.trailingAnchor, constant: 62).isActive = true
        
        strenghtValueLabel.topAnchor.constraint(equalTo: strenghtLabel.bottomAnchor, constant: 16).isActive = true
        strenghtValueLabel.leadingAnchor.constraint(equalTo: powerValueLabel.trailingAnchor, constant: 80).isActive = true
        strenghtValueLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        strenghtValueLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
    }
    func populateData() {
        if let hero = heroResult {
            heroFullName.text = hero.biography.fullName.isEmpty ? "No full name available" : hero.biography.fullName
            let heroImageURL = URL(string: hero.image.url)
            heroImage.kf.setImage(with: heroImageURL)
            durabilytLabel.text = "Durability"
            durabilityValueLabel.text = hero.powerstats.durability
            combatLabel.text = "Combat"
            inteligenceLabel.text = "Inteligence"
            durabilityValueLabel.text = hero.powerstats.durability
            combatValueLabel.text = hero.powerstats.combat
            inteligenceValueLabel.text = hero.powerstats.intelligence
            powerLabel.text = "Power"
            powerValueLabel.text = hero.powerstats.power
            strenghtLabel.text = "Strenght"
            strenghtValueLabel.text = hero.powerstats.strength
            speedLabel.text = "Speed"
            speedValueLabel.text = hero.powerstats.speed
        }
        
    }
    
}




