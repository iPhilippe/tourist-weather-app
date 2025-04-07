//
//  HomeViewModel.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//

import Combine
import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    var router: (HomeRouter)?
    private var allTouristPoints: [TouristPoint] = []
    @Published var touristPointList: [TouristPoint] = []
  
    init () {
        getTouristPointsList()
    }
    
    func getTouristPointsList () {
        self.allTouristPoints = TouristPoint.allCases
        self.touristPointList = allTouristPoints
    }
    
    func onChangeOfSearchText(text: String) {
        if text.isEmpty {
            touristPointList = allTouristPoints
            return
        }
        
        let filtered = allTouristPoints.filter { item in
            FilterListContent(
                searchText: text.textForSearch(),
                content: item.rawValue.textForSearch()
            )
        }
        touristPointList = filtered
    }
    
    //MARK: Navigation
    func pushDetailsView(point: TouristPoint) {
        router?.route(to: .weatherDetails(point: point))
    }
}
