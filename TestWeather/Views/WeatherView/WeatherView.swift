//
//  WeatherView.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import SwiftUI

struct WeatherView: View {
    let weather : CurrentWeather
    
    var body: some View {
        VStack{
            Image("sun")
                .resizable()
                .scaledToFill()
                .frame(width: (CGFloat(3)*(Constants.Dimensions.defaultWidth)),
                       height: (CGFloat(3)*(Constants.Dimensions.defaultHeight)),
                       alignment: .center)
            VStack (alignment: .center){
                Text("\(String(format: "%.1f", self.weather.tempC ?? 0.0 )) °C")
                    .font(.system(size: Constants.Font.LG))
                Text(self.weather.condition.text)
                    .font(.system(size: Constants.Font.MD))
            }.padding(8)
            HStack{
                Spacer()
                WeatherWidget(image: Constants.Images.wind, text: Constants.Strings.wind, title: "\(String(format: "%.1f", self.weather.windMph )) Mph")
                Spacer()
                WeatherWidget(image: Constants.Images.humidity, text: Constants.Strings.humidity, title: "\(String( self.weather.humidity  )) %")
                Spacer()
                WeatherWidget(image: Constants.Images.cold, text: Constants.Strings.feelsLike, title: "\(String(format: "%.1f", self.weather.feelslikeC )) °C")
                Spacer()
            }
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            RoundedRectangle(cornerRadius: Constants.Dimensions.cornerRadius)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: Constants.Colors.gradient),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: CurrentWeather.empty())
    }
}
