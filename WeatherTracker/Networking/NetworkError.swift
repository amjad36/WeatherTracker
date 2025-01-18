//
//  NetworkError.swift
//  WeatherTracker
//
//  Created by Amjad on 18/01/25.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
}
