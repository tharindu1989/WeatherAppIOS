//
//  WeatherApiService.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import Foundation
import Alamofire

protocol WeatherApiServiceProtocol {
    func fetchWeather(city : String) async throws -> WeatherResponse
}

final class WeatherApiService : WeatherApiServiceProtocol{
    
    func fetchWeather(city : String) async throws -> WeatherResponse {
        let url = "\(Constants.Strings.BASE_URL)?key=\(Constants.Strings.API_KEY)&q=\(city)&days=5&aqi=no&alerts=no"
        let value = try await AF.request(url).serializingDecodable(WeatherResponse.self).value
        return value
    }
}
