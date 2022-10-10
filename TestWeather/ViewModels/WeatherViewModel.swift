//
//  WeatherViewModel.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import Foundation


final class WeatherViewModel : ObservableObject {
    
    private let weatherRepository : WeatherRepositoryProtocol
    
    init(repository : WeatherRepositoryProtocol = WeatherRepository()){
        self.weatherRepository = repository
    }
    
    func getWeatherData(cityName : String){
        Task{
            do{
                let weather = try await weatherRepository.getWeatherInfo(city: cityName)
                debugPrint(weather)
            }catch {
                debugPrint(error)
            }
        }
    }
    
}
