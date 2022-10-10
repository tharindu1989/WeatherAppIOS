//
//  WeatherResponse.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

struct WeatherResponse: Codable {
    //let location: Location
    let current: CurrentWeather
    let forecast: Forecast
    
    static func empty(forecasts : [Forecastday] = [])->WeatherResponse {
        return WeatherResponse(current: CurrentWeather.empty(), forecast: Forecast(forecastday: forecasts))
    }
}
