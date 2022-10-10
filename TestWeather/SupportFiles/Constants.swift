//
//  Constants.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//
import SwiftUI

class Constants {

    class Strings {
        static let API_KEY = "21237506e50e4d3b99c04446221010"
        static let BASE_URL = "https://api.weatherapi.com/v1/forecast.json"
        static let defaultCity = "London"
        static let wind = "Wind Speed"
        static let humidity = "Humidity"
        static let rain = "Rain Chances"
        static let feelsLike = "Feels Like"
    }
    
    class Dimensions {
        static let firstSpacing: CGFloat = 8
        static let secondSpacing: CGFloat = 16
        static let defaultPadding: CGFloat = 24
        static let cornerRadius: CGFloat = 8
        static let defaultWidth: CGFloat = 32
        static let defaultHeight: CGFloat = 32
    }
    
    class Font {
        static let SM: CGFloat = 16
        static let MD: CGFloat = 32
        static let LG: CGFloat = 40
    }
    
    class Images {
        static let humidity = "humidity"
        static let wind = "wind"
        static let umbrella = "umbrella"
        static let cold = "cold"
        static let warm = "warm"
        static let magnifyingGlass = "magnifyingglass"
        static let location = "location.fill"
    }
    
    class Colors {
        static let appUpMainColor = SwiftUI.Color(red: 180 / 255, green: 214 / 255, blue: 238 / 255)
        static let appDownMainColor = SwiftUI.Color(red: 121 / 255, green: 231 / 255, blue: 209 / 255)
        static let lightBlueColor = SwiftUI.Color(red: 87 / 255, green: 209 / 255, blue: 240 / 255)
        static let meduimBlueColor = SwiftUI.Color(red: 59 / 255, green: 164 / 255, blue: 237 / 255)
        static let darkBlueColor = SwiftUI.Color(red: 17 / 255, green: 74 / 255, blue: 170 / 255)
        static let gradient = [lightBlueColor.opacity(0.5), darkBlueColor.opacity(0.5)]
        static let gradientAPP = [appUpMainColor, appDownMainColor]
        static let gradientSerchMenu = [appUpMainColor.opacity(0.5), appDownMainColor.opacity(0.5)]
    }
}
