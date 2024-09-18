//
//  Tab.swift
//  TabBar_SwiftUI
//
//  Created by Rajani Karukola on 2024-09-18.
//

import Foundation


enum Tab: String, CaseIterable {
    case home = "Home"
    case search = "Search"
    case categories = "Categories"
    case myList = "My List"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .categories:
            return "square.grid.3x3.square"
        case .myList:
            return "plus.circle"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
