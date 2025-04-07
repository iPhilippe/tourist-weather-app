//
//  TouristPoints.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 06/04/25.
//
import Foundation

public struct TouristPointResult {
    let point: TouristPoint
    let weatherInfo: WeatherDetails
}

struct WeatherDetails: Decodable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let timezone: Int
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Decodable {
    private let temp: Double
    private let feels_like: Double
    private let temp_min: Double
    private let temp_max: Double
    let pressure: Int
    let humidity: Int
    
    var tempCelsius: Double {
        return convertToCelsius(temp)
    }
    
    var feelsLikeCelsius: Double {
        return convertToCelsius(feels_like)
    }
    
    var tempMinCelsius: Double {
        return convertToCelsius(temp_min)
    }
    
    var tempMaxCelsius: Double {
        return convertToCelsius(temp_max)
    }
}

struct Wind: Decodable {
    let speed: Double
}

//MARK: - Helper Functions
private func convertToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}
