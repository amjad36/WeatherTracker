//
//  MockWeatherService.swift
//  WeatherTrackerTests
//
//  Created by Amjad on 26/01/25.
//

import Foundation
@testable import WeatherTracker

final class MockWeatherService: WeatherServiceProtocol {
    
    func fetchWeather<T: Decodable>(_ endpoint: WeatherTracker.Endpoint) async throws -> T {
            
        let weatherJson = """
        {
            "location":{
                "name":"New York",
                "region":"New York",
                "country":"United States of America"
            },
            "current":{
                "temp_c":1.1,
                "condition":{
                    "text":"Sunny",
                    "icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"
                },
                "humidity":49,
                "feelslike_c":-3.7,
                "uv":0.5
            }
        }
        """
        
        guard let data = weatherJson.data(using: .utf8) else {
            fatalError("Failed to convert weatherJson to Data")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        }
        catch {
            throw NetworkError.decodingError(error)
        }
    }
}
