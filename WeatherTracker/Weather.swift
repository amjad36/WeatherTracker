//
//  Weather.swift
//  WeatherTracker
//
//  Created by Amjad on 18/01/25.
//

import Foundation

public struct Weather: Codable {
    let location: Location
    let current: Current
}

public struct Location: Codable {
    let name: String
    let region: String
    let country: String
}

public struct Current: Codable {
    let temprature: Double
    let humidity: Double
    let uvIndex: Double
    let feelsLikeTemperature: Double
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case temprature = "temp_c"
        case humidity
        case uvIndex = "uv"
        case feelsLikeTemperature = "feelslike_c"
        case condition
    }
}

public struct Condition: Codable {
    let text: String
    let icon: String
}
