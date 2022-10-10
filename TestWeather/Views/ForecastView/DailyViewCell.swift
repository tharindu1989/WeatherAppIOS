//
//  DailyViewCell.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import SwiftUI

struct DailyViewCell: View {
    let weather : Forecastday
    
    var body: some View {
        HStack {
            HStack {
                Text(weather.date)
                    .frame(width: 50)
            }
            Spacer()
            AsyncImage(url: URL(string: "https:\(self.weather.day.condition.icon)"))
            Spacer()
            HStack {
                Image(Constants.Images.cold)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("\(String(format: "%.1f",self.weather.day.mintempC))°C")
            }
            Spacer()
            HStack {
                Image(Constants.Images.warm)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("\(String(format: "%.1f",self.weather.day.maxtempC))°C")
            }
        }
        .font(.system(size: Constants.Font.SM))
        .foregroundStyle(.white)
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: Constants.Dimensions.cornerRadius)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: Constants.Colors.gradient),
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
        )
        .shadow(color: Color.white.opacity(0.1),
                radius: 2,
                x: -2,
                y: -2)
        .shadow(color: Color.black.opacity(0.2),
                radius: 2,
                x: 2,
                y: 2)
    }
}

struct DailyViewCell_Previews: PreviewProvider {
    static var previews: some View {
        DailyViewCell(weather: Forecastday.empty())
    }
}
