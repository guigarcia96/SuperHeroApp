//
//  DetailsHeroViewController.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 02/02/21.
//

import UIKit

class DetailsHeroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var heroResult:Result?
    var powerstats = [String]()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrappedHeroResult = heroResult else { return }
        title = unwrappedHeroResult.name
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HeroPowerStatsCollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        setupCollectionConstraints()
        
    }
    
    func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let powerstatus = heroResult?.powerstats {
            powerstats.append(powerstatus.combat)
            powerstats.append(powerstatus.durability)
            powerstats.append(powerstatus.intelligence)
            powerstats.append(powerstatus.power)
            powerstats.append(powerstatus.speed)
            powerstats.append(powerstatus.strength)
        }
        
       
        return powerstats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HeroPowerStatsCollectionViewCell
        cell.titleLabel.text = powerstats[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 100)
    }
    
    
}
