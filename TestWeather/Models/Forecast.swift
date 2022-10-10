//
//  Forecast.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import Foundation

struct Forecast: Codable {
    let forecastday: [Forecastday]
    
    static func empty(list : [Forecastday] = [])->Forecast {
        return Forecast(forecastday: list)
    }
}

struct Forecastday: Codable, Identifiable {
    let date: String
    let dateEpoch: Int
    let day: Day
    var id: UUID {
        UUID()
    }

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
    }
    
    static func empty() -> Forecastday{
        return Forecastday(date: "2022-11-11", dateEpoch: 1, day: Day.empty())
    }
}

struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String
    let moonPhase, moonIllumination: String

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}

struct Day: Codable {
    let maxtempC, mintempC: Double
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition
    }
    
    static func empty() -> Day{
        return Day(maxtempC: 12.5, mintempC: 13.5, condition: Condition.empty())
    }
}

