//
//  HomeScreen.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            SearchView(){ cityName in
                viewModel.getWeatherData(cityName: cityName)
            }
            ScrollView {
                if(viewModel.weather != nil) {
                    WeatherView(weather: viewModel.weather!)
                }
                if(!viewModel.dailyForecast.isEmpty){
                    ForecastView(forcasts: viewModel.dailyForecast)
                }
                if(viewModel.error != nil){
                    Text(viewModel.error!)
                        .padding(Constants.Dimensions.defaultPadding)
                        .bold()
                        .font(.system(size: Constants.Font.SM))
                        .foregroundStyle(.white)
                }
            }
        }
        .onAppear{
            viewModel.getWeatherData(cityName: "London")
        }
        .frame(
            maxHeight:.infinity,
            alignment: .topLeading
        )
        .padding(8)
        .background(
            LinearGradient(
                gradient: Gradient(colors: Constants.Colors.gradientAPP),
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
        )
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
