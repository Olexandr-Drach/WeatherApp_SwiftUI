//
//  CityModel.swift
//  WheatherSwiftUI
//
//  Created by Oleksandr on 25.07.2023.
//

import Foundation

struct Forecast: Codable {
    
    
    // --------NOT ALL PROPERTES-------//
    // --------THERE ARE MORE----------//
    
    let list: [ForecastModel]
    struct ForecastModel: Codable {
        
        let main: Main
        struct Main: Codable {
            let temp: Double
            let feels_like: Double
            let temp_min: Double
            let temp_max: Double
            let pressure: Double
            let humidity: Double
        }
        let visibility: Double
        let dt_txt: String
        
        let wind: Wind
        struct Wind: Codable {
            let speed: Double
            let gust: Double
        }
        
    }
    
    let city: City
    struct City: Codable {
        let name: String
        let country: String
    }
}

