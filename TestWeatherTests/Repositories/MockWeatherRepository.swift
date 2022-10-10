//
//  MockWeatherRepository.swift
//  TestWeatherTests
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import Foundation

final class MockWeatherRepository : WeatherRepositoryProtocol {
    
    let mockService : MockWeatherApiService
    
    init(mockService : MockWeatherApiService = MockWeatherApiService()){
        self.mockService = mockService
    }
    
    func getWeatherInfo(city: String) async throws -> WeatherResponse {
        return try await self.mockService.fetchWeather(city: city)
    }
}
