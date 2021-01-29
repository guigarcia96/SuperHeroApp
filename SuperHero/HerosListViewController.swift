//
//  HerosListViewController.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 28/01/21.
//

import UIKit

class HerosListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var heroName: String?
    
    var welcome = Welcome(response: "", resultsFor: "", results: [])
    
    var herosModel = [String]()
    
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
                self.herosModel.append(result.name)
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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return herosModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let heroCellName = herosModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = heroCellName
        return cell
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
