//
//  ItemView.swift
//  WheatherSwiftUI
//
//  Created by Oleksandr on 26.07.2023.
//

import SwiftUI

struct ItemView: View {
    
    // - MARK: Properties
    
    
    var item: Forecast.ForecastModel
    
    
    var body: some View {
        
        ZStack {
            GradientView(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))])
                .frame(width: 180, height: 180)
                .cornerRadius(90)
            VStack(alignment: .center){
                HStack {
                    Image(systemName: "humidity.fill")
                        .resizable()
                        .foregroundColor(.cyan)
                        .frame(width: 30, height: 30)
                        .cornerRadius(5)
                    Text(String(format: "%.0f", item.main.humidity) + "%")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                }
                HStack {
                    Image(systemName: "thermometer.sun.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 38, height: 38)
                        .cornerRadius(5)
                    Text(String(format: "%.1f", item.main.temp - 273.15) + "℃")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold))
                }
                HStack {
                    Image(systemName: "wind")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 30, height: 30)
                        .cornerRadius(5)
                    Text(String(format: "%.1f", item.wind.speed * 1.6) + "km/h")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                }
                
                Text("\(item.dt_txt.components(separatedBy: " ")[0])")
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .semibold))
                Text("\(item.dt_txt.components(separatedBy: " ")[1])")
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .semibold))
            }
            .padding()
        }
        .background(.clear)
    }
    
    
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        let testItem = Forecast.ForecastModel(main: Forecast.ForecastModel.Main(temp: 34, feels_like: 56, temp_min: 78, temp_max: 90, pressure: 32, humidity: 12), visibility: 10, dt_txt: "26.08.2023", wind: Forecast.ForecastModel.Wind(speed: 45, gust: 45))
        
        ItemView(item: testItem)
    }
    
}
