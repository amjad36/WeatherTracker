//
//  WeatherViewModel.swift
//  WeatherTracker
//
//  Created by Amjad on 17/01/25.
//

import Foundation

public enum WeatherViewState {
    case empty
    case savedCity
    case resultCard
}

final class WeatherViewModel: ObservableObject {
    @Published var viewState: WeatherViewState = .empty
    @Published var weather: Weather?
    @Published var error: Error?
    
    @MainActor
    func fetchWeather(for city: String) async {
        do {
            weather = try await WeatherService.shared.fetchWeather(.currentWeather(city))
            viewState = .resultCard
        }
        catch {
            self.error = error
        }
    }
    
    func saveCity(_ city: String) {
        UserDefaults.standard.set(city, forKey: "savedCity")
        viewState = .savedCity
    }
}
