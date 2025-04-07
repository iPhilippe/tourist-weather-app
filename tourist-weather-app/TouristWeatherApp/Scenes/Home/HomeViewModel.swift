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
    @Published var touristPoints: [TouristPointResult] = []
    @Published var isLoading: Bool = false
    @Published var error: Bool = false
        
    
    func getWeatherData(local: TouristPoint) {
        showLoading()
        Task {
            defer { hideLoading() }
            do {
                let touristPoint = try await OpenWeatherMapService.shared.getWeather(for: local)
                print("Temperatura: \(touristPoint.weatherInfo.main.temp)°F")
                print("Descrição: \(touristPoint.pointName.description())")
            } catch {
                self.error = true
                print("Erro ao buscar clima: \(error.localizedDescription)")
            }
        }
     
    }
    
    //MARK: - Loading
    func showLoading() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }

    
    //MARK: Navigation
    func pushDetailsView() {
    }
}
