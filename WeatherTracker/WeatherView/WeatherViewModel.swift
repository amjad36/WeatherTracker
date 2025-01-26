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
    private let weatherService: WeatherServiceProtocol
    
    @Published var viewState: WeatherViewState = .empty
    @Published var weather: Weather?
    @Published var error: Error?
    
    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }
    
    @MainActor
    func fetchWeather(for city: String) async {
        do {
            weather = try await weatherService.fetchWeather(.currentWeather(city))
        }
        catch {
            self.error = error
        }
    }
    
    func saveSelectedCity() {
        guard let cityName = weather?.location.name else {
            print("Failed to save city name.")
            return
        }
        UserDefaults.standard.set(cityName, forKey: Constants.cityNameKey)
    }
    
    func getSavedCityName() -> String? {
        return UserDefaults.standard.string(forKey: Constants.cityNameKey)
    }
}
