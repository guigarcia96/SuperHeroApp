//
//  SearchBars.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 12/02/21.
//

import Foundation
import UIKit

class SearchBars {
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    
}
