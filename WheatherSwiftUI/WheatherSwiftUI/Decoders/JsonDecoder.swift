//
//  JsonDecoder.swift
//  WheatherSwiftUI
//
//  Created by Oleksandr on 25.07.2023.
//

import Foundation

class JsonDecoder {
    
    // - MARK: Properties
   
    
    
    // - MARK: Actions
    
    func decodeWeather(from data: Data, complation: @escaping (WeatherModel) -> Void) {
        DispatchQueue.global().async {
            do {
                let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                    complation(weather)
            }
            catch {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    
    func decodeForecast(from data: Data, complation: @escaping (Forecast) -> Void) {
        DispatchQueue.global().async {
            do {
                let forecast = try JSONDecoder().decode(Forecast.self, from: data)
                    complation(forecast)
            }
            catch {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    
    
}
