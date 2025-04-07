//
//  DetailViewModel.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 06/04/25.
//
import Combine
import Foundation
import SwiftUI

class DetailViewModel: ObservableObject {
    @Published var touristPoints: TouristPointResult?
    @Published var isLoading: Bool = false
    @Published var error: Bool = false
    let touristPoint : TouristPoint
    
    init(touristPoint: TouristPoint) {
        self.touristPoint = touristPoint
        getWeatherData(local: touristPoint)
    }
    
    func getWeatherData(local: TouristPoint) {
        showLoading()
        Task {
            defer { hideLoading() }
            do {
                let result = try await OpenWeatherMapService.shared.getWeather(for: local)
                await MainActor.run {
                    self.error = false
                    self.touristPoints = result
                }
            } catch {
                await MainActor.run {
                    self.error = true
                }
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
}
