//
//  ForecastView.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import SwiftUI

struct ForecastView: View {
    let forcasts : [Forecastday]
    
    var body: some View {
        ForEach(self.forcasts) { forcast in
            LazyVStack {
                DailyViewCell(weather: forcast)
            }
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(forcasts: [Forecastday](repeating: Forecastday.empty(),count: 5))
    }
}
