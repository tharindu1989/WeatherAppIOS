//
//  MockWeatherApiService.swift
//  TestWeatherTests
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import Foundation

class MockWeatherApiService : WeatherApiServiceProtocol {
    
    func fetchWeather(city: String) async throws -> WeatherResponse {
        return WeatherResponse.empty()
    }
}

