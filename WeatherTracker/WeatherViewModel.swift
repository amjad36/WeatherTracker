//
//  WeatherViewModel.swift
//  WeatherTracker
//
//  Created by Amjad on 17/01/25.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var error: Error?
    
    @MainActor
    func fetchWeather(for city: String) async {
        do {
            weather = try await WeatherService.shared.fetchWeather(.currentWeather(city))
        }
        catch {
            self.error = error
        }
    }
}
