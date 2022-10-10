//
//  WeatherViewModel.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import Foundation


final class WeatherViewModel : ObservableObject {
    
    @Published var weather : CurrentWeather? = nil
    @Published var dailyForecast : [Forecastday] = []
    @Published var error : String? = nil
    private let weatherRepository : WeatherRepositoryProtocol
    
    init(repository : WeatherRepositoryProtocol = WeatherRepository()){
        self.weatherRepository = repository
    }
    
    func getWeatherData(cityName : String){
        Task{
            do{
                DispatchQueue.main.async { self.error = nil }
                let weather = try await weatherRepository.getWeatherInfo(city: cityName)
                DispatchQueue.main.async {
                    self.weather = weather.current
                    self.dailyForecast = weather.forecast.forecastday.map(self.toDailyWeather)
                }
            }catch {
                DispatchQueue.main.async {
                    self.weather = nil
                    self.dailyForecast = []
                    self.error = "An Error Occurred! Please Try Again "
                    
                }
            }
        }
    }
    
    private func toDailyWeather(forecast : Forecastday)->Forecastday{
        return Forecastday(date:self.formatDate(inputDate: forecast.date), dateEpoch: forecast.dateEpoch, day: forecast.day)
    }
    
    private func formatDate(inputDate: String)->String{
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd"
        
        let oldDate = olDateFormatter.date(from: inputDate)
        
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "EEE"

        return convertDateFormatter.string(from: oldDate!)
    }
    
}
