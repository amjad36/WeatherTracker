//
//  Endpoint.swift
//  WeatherTracker
//
//  Created by Amjad on 18/01/25.
//

import Foundation

public enum Endpoint {
    case currentWeather(_ city: String)
    
    var url: String {
        switch self {
        case .currentWeather(let city):
            var stringValue = "/current.json?"
            stringValue += "q=\(city)&key=\(Constants.apiKey)"
            return stringValue
        }
    }
}
