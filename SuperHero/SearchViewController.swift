//
//  ViewController.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 28/01/21.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    
    lazy var heroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite o nome do seu Super Herói favorito no campo de busca acima"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setSearchBarToNavigationBar()
        setupLabelConstraint()
    }
    
    func setSearchBarToNavigationBar() {
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    func setupLabelConstraint() {
        view.addSubview(heroLabel)
        
        heroLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        heroLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heroLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            let heroNameVC = HerosListViewController()
            heroNameVC.heroName = text
            navigationController?.pushViewController(heroNameVC, animated: true)
            
        }
    }
    
    
    
    
}

