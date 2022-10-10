//
//  SearchView.swift
//  TestWeather
//
//  Created by Tharindu Thilanka on 10/10/22.
//

import SwiftUI

struct SearchView: View {
    
    enum Field: Hashable {
        case myField
    }
    
    @State var cityName : String = Constants.Strings.defaultCity
    @FocusState private var focusedField: Field?
    let onClick : (String)->Void
    
    var body: some View {
        HStack {
            Image(systemName: Constants.Images.location)
                .foregroundColor(.blue)
                .padding(.leading, Constants.Dimensions.defaultPadding)
            TextField("Enter City",text: $cityName)
                .padding(.leading, 16)
                .font(.system(size: Constants.Font.MD))
                .focused($focusedField, equals: .myField)
                .onSubmit{
                    onClick(cityName)
                }
            Button{
                focusedField = nil
                onClick(cityName)
            } label: {
                ZStack {
                    
                    Image(systemName: Constants.Images.magnifyingGlass)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: Constants.Dimensions.cornerRadius)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: Constants.Colors.gradientSerchMenu),
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
        })
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(){ cityName in
            
        }
    }
}
