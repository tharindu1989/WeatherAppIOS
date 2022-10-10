//
//  WeatherWidget.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import SwiftUI

struct WeatherWidget: View {
    
    @State var image : String
    @State var text : String
    let title : String
    
    
    var body: some View {
        VStack {
            Text(text)
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: Constants.Dimensions.defaultWidth,
                       height: Constants.Dimensions.defaultHeight,
                       alignment: .center)
            Text(title)
        }
        .font(.system(size: Constants.Font.SM))
    }
}

struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidget(image: Constants.Images.umbrella, text: "Wind Speed", title: "123")
    }
}
