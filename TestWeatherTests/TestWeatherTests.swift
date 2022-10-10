//
//  TestWeatherTests.swift
//  TestWeatherTests
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import XCTest
@testable import TestWeather

final class TestWeatherTests: XCTestCase {

    
    
    func testWeatherDetail() throws {
       
        let expectation = XCTestExpectation(description: "fetch weather detail" )
        let viewModel = WeatherViewModel(repository: MockWeatherRepository())
        let asyncWaitDuration = 2.0
        
        XCTAssertNil(viewModel.weather)
        
        viewModel.getWeatherData(cityName: "London")
                
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {
          expectation.fulfill()
          // Verify state after
          XCTAssertEqual(viewModel.weather?.condition.text, "Patchy rain possible")
        }

       wait(for: [expectation], timeout: asyncWaitDuration)
    }
    
    func testDailyForecast() throws {
       
        let expectation = XCTestExpectation(description: "fetch weather detail" )
        let viewModel = WeatherViewModel(repository: MockWeatherRepository())
        let asyncWaitDuration = 2.0
        
        XCTAssertTrue(viewModel.dailyForecast.isEmpty)
        
        viewModel.getWeatherData(cityName: "London")
                
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {
          expectation.fulfill()
          // Verify state after
            XCTAssertEqual(viewModel.dailyForecast.count, 5)
          // Verify Date Formater
            XCTAssertEqual(viewModel.dailyForecast[0].date, "Fri")
        }

       wait(for: [expectation], timeout: asyncWaitDuration)
    }
    
}
