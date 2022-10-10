//
//  WeatherRepository.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import Foundation

protocol WeatherRepositoryProtocol {
    func getWeatherInfo(city : String) async throws -> WeatherResponse
}

class WeatherRepository : WeatherRepositoryProtocol {
    
    private let apiService : WeatherApiServiceProtocol
    
    init(apiService : WeatherApiServiceProtocol = WeatherApiService()){
        self.apiService = apiService
    }
    
    func getWeatherInfo(city : String) async throws -> WeatherResponse {
        return try await apiService.fetchWeather(city: city)
    }
}
