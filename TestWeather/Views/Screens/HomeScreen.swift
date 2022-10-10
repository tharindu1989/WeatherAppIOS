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
            if(viewModel.weather != nil) {
                WeatherView(weather: viewModel.weather!)
            }
        }.onAppear{
            viewModel.getWeatherData(cityName: "London")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
