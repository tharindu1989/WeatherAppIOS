//
//  CurrentWeather.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

struct CurrentWeather: Codable {
    let tempC: Double?
    let condition: Condition
    let windMph: Double
    let humidity : Int
    let feelslikeC : Double

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case windMph = "wind_mph"
        case humidity
        case feelslikeC = "feelslike_c"
    }
    
    static func empty()-> CurrentWeather{
        return CurrentWeather(tempC: 32.5, condition: Condition.empty(), windMph: 32.4, humidity: 80, feelslikeC: 32.2)
    }
    
}

struct Condition: Codable {
    let text: String
    let icon: String
    let code: Int
    
    static func empty()->Condition {
        return Condition(text: "Patchy rain possible", icon: "//cdn.weatherapi.com/weather/64x64/day/176.png", code: 1063)
    }
}
