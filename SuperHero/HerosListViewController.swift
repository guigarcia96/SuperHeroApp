//
//  HerosListViewController.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 28/01/21.
//

import UIKit
import Kingfisher

class HerosListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var heroName: String?
    
    var welcome = Welcome(response: "", resultsFor: "", results: [])
    
    var resultsModel = [Result]()
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        safeArea = view.layoutMarginsGuide
        tableView.dataSource = self
        tableView.delegate = self
        title = "Heros"
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let unwrappedHeroName = heroName?.removeWhitespace() else {return}
        loadData(heroName: unwrappedHeroName)
    }
    
    func loadData(heroName: String) {
        APIRequest.loadItems(heroName: heroName , onComplete: {(welcome) in
            self.welcome = welcome
            
            for result in welcome.results {
                self.resultsModel.append(result)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }){ (error) in
            print(error)
        }
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.register(ListHeroTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let heroCellName = resultsModel[indexPath.row].name
        let heroRealName = resultsModel[indexPath.row].biography.fullName
        let heroImage = resultsModel[indexPath.row].image.url
        let imageURL = URL(string: heroImage)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ListHeroTableViewCell else {return UITableViewCell()}
        cell.heroNameLabel.text = heroCellName
        cell.heroRealNameLabel.text = heroRealName
        cell.listImageView.kf.setImage(with: imageURL)
        return cell
        
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailtsHeroVC = DetailsHeroViewController()
        detailtsHeroVC.heroResult = resultsModel[indexPath.row]
        
        navigationController?.pushViewController(detailtsHeroVC, animated: true)
        
        
    }
    
    
    
}
extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "%20")
    }
}
