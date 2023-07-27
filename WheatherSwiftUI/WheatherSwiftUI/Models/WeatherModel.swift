//
//  WheatherModel.swift
//  WheatherSwiftUI
//
//  Created by Oleksandr on 25.07.2023.
//

import Foundation


/// JSON weather model.
struct WeatherModel: Codable {
    
    // Some components to decode:
    // - [-------coordinaates-----------] !!!!!!
    
    // - description
    // - current temperature
    // - min & max temperature
    // - Humidity
    // - wind speed
    
    
    // API HAS NO OTHER WAY TO GET FORECAST, ONLY USING COORDINATE KEY IN A REQUEST!
    let coord: Coordinate
    struct Coordinate: Codable {
        let lon: Double
        let lat: Double
    }
    
    let weather: [WeatherObject]
    struct WeatherObject: Codable {
        let description: String
    }
    
    let main: Main
    struct Main: Codable {
        let temp: Double
        let temp_max: Double
        let temp_min: Double
        let humidity: Int
    }
    
    let wind: Wind
    struct Wind: Codable {
        let speed: Double
    }
    
}
