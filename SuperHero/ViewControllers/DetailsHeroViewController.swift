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
    lazy var powerStatsView = Views.init().powerStatsView
    lazy var scrollView = Views.init().scrollView
    lazy var contentView = Views.init().contentView
    lazy var birthLabel = Labels.init().commonLabel
    lazy var birthLabelValue = Labels.init().grayLabel
    lazy var publisher = Labels.init().commonLabel
    lazy var publisherValue = Labels.init().grayLabel
    lazy var firstAppearence = Labels.init().commonLabel
    lazy var firstAppearenceValue = Labels.init().grayLabel
    lazy var genderLabel = Labels.init().commonLabel
    lazy var genderValueLabel = Labels.init().grayLabel
    lazy var raceLabel = Labels.init().commonLabel
    lazy var raceValueLabel = Labels.init().grayLabel
    
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(heroImage)
        contentView.addSubview(heroFullName)
        contentView.addSubview(powerStatsView)
        contentView.addSubview(birthLabel)
        contentView.addSubview(birthLabelValue)
        contentView.addSubview(publisher)
        contentView.addSubview(publisherValue)
        contentView.addSubview(firstAppearence)
        contentView.addSubview(firstAppearenceValue)
        contentView.addSubview(genderLabel)
        contentView.addSubview(genderValueLabel)
        contentView.addSubview(raceLabel)
        contentView.addSubview(raceValueLabel)
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
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        heroImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        heroImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        heroImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        let imageViewHeightConstraint = heroImage.heightAnchor.constraint(equalToConstant: 160)
        imageViewHeightConstraint.priority = UILayoutPriority(rawValue: 999)
        imageViewHeightConstraint.isActive = true
        
        heroFullName.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 24).isActive = true
        heroFullName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        powerStatsView.topAnchor.constraint(equalTo: heroFullName.bottomAnchor, constant: 24).isActive = true
        powerStatsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        powerStatsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        powerStatsView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
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
        powerLabel.centerXAnchor.constraint(equalTo: powerStatsView.centerXAnchor).isActive = true
        
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
        
        birthLabel.topAnchor.constraint(equalTo: powerStatsView.bottomAnchor, constant: 24).isActive = true
        birthLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        birthLabelValue.topAnchor.constraint(equalTo: birthLabel.bottomAnchor, constant: 8).isActive = true
        birthLabelValue.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        birthLabelValue.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        publisher.topAnchor.constraint(equalTo: birthLabelValue.bottomAnchor, constant: 16).isActive = true
        publisher.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        publisherValue.topAnchor.constraint(equalTo: publisher.bottomAnchor, constant: 8).isActive = true
        publisherValue.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        publisherValue.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        firstAppearence.topAnchor.constraint(equalTo: publisherValue.bottomAnchor, constant: 16).isActive = true
        firstAppearence.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        firstAppearenceValue.topAnchor.constraint(equalTo: firstAppearence.bottomAnchor, constant: 8).isActive = true
        firstAppearenceValue.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        firstAppearenceValue.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        genderLabel.topAnchor.constraint(equalTo: firstAppearenceValue.bottomAnchor, constant: 16).isActive = true
        genderLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        genderValueLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 8).isActive = true
        genderValueLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        genderValueLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        raceLabel.topAnchor.constraint(equalTo: genderValueLabel.bottomAnchor, constant: 16).isActive = true
        raceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        raceValueLabel.topAnchor.constraint(equalTo: raceLabel.bottomAnchor, constant: 8).isActive = true
        raceValueLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        raceValueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -28).isActive = true
        raceValueLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true

    }
    func populateData() {
        if let hero = heroResult {
            heroFullName.text = hero.biography.fullName.isEmpty ? "No full name available" : hero.biography.fullName
            let heroImageURL = URL(string: hero.image.url)
            heroImage.kf.setImage(with: heroImageURL)
            durabilytLabel.text = "Durability"
            combatLabel.text = "Combat"
            inteligenceLabel.text = "Inteligence"
            strenghtLabel.text = "Strenght"
            powerLabel.text = "Power"
            speedLabel.text = "Speed"
            durabilityValueLabel.text = hero.powerstats.durability == "null" ? "N/A" : hero.powerstats.durability
            combatValueLabel.text = hero.powerstats.combat == "null" ? "N/A" : hero.powerstats.combat
            inteligenceValueLabel.text = hero.powerstats.intelligence == "null" ? "N/A" : hero.powerstats.intelligence
            powerValueLabel.text = hero.powerstats.power == "null" ? "N/A" : hero.powerstats.power
            strenghtValueLabel.text = hero.powerstats.strength == "null" ? "N/A" : hero.powerstats.strength
            speedValueLabel.text = hero.powerstats.speed == "null" ? "N/A" : hero.powerstats.speed
            birthLabel.text = "Place of Birth"
            birthLabelValue.text = hero.biography.placeOfBirth == "-" ? "Place of birth unknown" : hero.biography.placeOfBirth
            publisher.text = "Publisher"
            publisherValue.text = hero.biography.publisher == "null" ? "Publisher not available" : hero.biography.publisher
            firstAppearence.text = "First Appearence"
            firstAppearenceValue.text = hero.biography.firstAppearance == "-" ? "First appearance unknown" : hero.biography.firstAppearance
            genderLabel.text = "Gender"
            genderValueLabel.text = hero.appearance.gender == "-" ? "Unknown Gender" : hero.appearance.gender
            raceLabel.text = "Race"
            raceValueLabel.text = hero.appearance.race == "null" ? "Unknown Race" : hero.appearance.race
        }
        
    }
    
}
