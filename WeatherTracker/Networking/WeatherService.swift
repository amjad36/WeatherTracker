//
//  NetworkService.swift
//  WeatherTracker
//
//  Created by Amjad on 18/01/25.
//

import Foundation

public protocol WeatherServiceProtocol {
    func fetchWeather<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

public final class WeatherService: WeatherServiceProtocol {
    
    public func fetchWeather<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        
        guard let url = URL(string: Constants.baseURL + endpoint.url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        }
        catch {
            throw NetworkError.decodingError(error)
        }
    }
}
