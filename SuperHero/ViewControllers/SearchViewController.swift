//
//  ViewController.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 28/01/21.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    lazy var searchBar = SearchBars.init().searchBar
    
    lazy var heroLabel = Labels.init().homeScreenLabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

