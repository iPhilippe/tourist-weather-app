//
//  OpenWeatherMapService.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 06/04/25.
//

import Alamofire
import Foundation

final class OpenWeatherMapService {
    public static let shared = OpenWeatherMapService()
    
    private let baseURL = "https://pro.openweathermap.org/data/2.5/weather"
    
    private var apiKey: String {
        Bundle.main.object(forInfoDictionaryKey: constants.KEYS().OPENWEATHERMAP_API_KEY) as? String ?? ""
       }
    
    func getWeather(for point: TouristPoint) async throws -> TouristPointResult {
        let coordinates = point.getCoordinates()
        
        let parameters: [String: Any] = [
            "lat": coordinates.lat,
            "lon": coordinates.lon,
            "appid": apiKey
        ]
        
        let dataTask = AF.request(baseURL, method: .get, parameters: parameters)
            .serializingDecodable(WeatherDetails.self)
        
        let response = await dataTask.response
        
        if let error = response.error {
            throw error
        }
        
        guard let weatherInfo = response.value else {
            throw URLError(.badServerResponse)
        }
        
        return TouristPointResult(point: point, weatherInfo: weatherInfo)
    }
}
