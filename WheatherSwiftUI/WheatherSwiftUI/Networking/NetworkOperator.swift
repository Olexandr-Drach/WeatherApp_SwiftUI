//
//  NetworkOperator.swift
//  WheatherSwiftUI
//
//  Created by Oleksandr on 25.07.2023.
//

import Foundation


class NetworkOperator: NSObject {
    
    // - MARK: Properties
    
    private let headers = APIKey.headers
    private let host = APIKey.host
   
    
    // - MARK: Actions
    
    func getWeather(forCity: String, complation: @escaping (Data) -> Void) {
        let city = forCity.lowercased()
        print(city)
        guard let url = URL(string:"\(host)\(city)") else { return }
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let weatherData = data {
                let json = NSString(data: weatherData, encoding: String.Encoding.utf8.rawValue)
                print(json ?? "No weather json !")
                complation(weatherData)
            }
            else {
                guard let error = error, let httpResponse = response as? HTTPURLResponse else { return }
                print("Error: \(error.localizedDescription)")
                print("Status: \(httpResponse.statusCode)")
                return
            }
        })
        dataTask.resume()
    }
    
    
    
    
    func getForecast(lat: Double, lon: Double, complation: @escaping (Data) -> Void) {
        print("\(lat)/\(lon)")
        let forecastKey = "fivedaysforcast/\(lat)/\(lon)"
        guard let url = URL(string:"\(host)\(forecastKey)") else { return }
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let forecastData = data {
                let json = NSString(data: forecastData, encoding: String.Encoding.utf8.rawValue)
                print(json ?? "No forecast json!")
                complation(forecastData)
            }
            else {
                guard let error = error, let httpResponse = response as? HTTPURLResponse else { return }
                print("Error: \(error.localizedDescription)")
                print("Status: \(httpResponse.statusCode)")
                return
            }
        })
        dataTask.resume()
    }
    
    
}
