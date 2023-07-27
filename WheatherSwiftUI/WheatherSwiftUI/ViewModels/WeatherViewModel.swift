//
//  WeatherViewModel.swift
//  WeatherSwiftUI
//
//  Created by Oleksandr on 25.07.2023.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    struct Coordinate {
        let lat: Double
        let long: Double
        
    }
    
    // - MARK: Properties
    
    @Published var forecasts: [[Forecast.ForecastModel]] = []
    
    @Published var cityName = "Lviv, UA"
    
    var searchCity = "Lviv"
    
    private var coordinate: Coordinate!
    
    private let decoder = JsonDecoder()
    private let networkOperator = NetworkOperator()
    
    
    // - MARK: Init
    init() {
        if let city = LocationOperator.shared.cityName {
            searchCity = city
        }
        loadWeather {}
    }
    
    // - MARK: Actions
    
    
    func loadWeather(complation: @escaping () -> Void) {
        networkOperator.getWeather(forCity: searchCity) { [weak self] (data) in
            guard let self = self else { return }
            self.decoder.decodeWeather(from: data) { [weak self] (weather) in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.coordinate = Coordinate(lat: weather.coord.lat, long: weather.coord.lon)
                    self.loadForecast {}
                }
            }
        }
    }
    
    private func loadForecast(complation: @escaping () -> Void) {
        networkOperator.getForecast(lat: coordinate.lat, lon: coordinate.long) { [weak self] (data) in
            guard let self = self else { return }
           // print(data)
            
            self.decoder.decodeForecast(from: data) { [weak self] (forecast) in
                guard let self = self else { return }
               // print(forecast)
                DispatchQueue.main.async {
                    let city = forecast.city
                    self.cityName = "\(city.name), \(city.country)"
                    self.forecasts = stride(from: 0, to: forecast.list.count, by: 8).map {
                        return Array(forecast.list[$0 ..< min($0 + 8, forecast.list.count)])
                    }
                    
                }
                
            }
        }
    }
    
    
    
    
    
}


