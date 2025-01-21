//
//  WeatherView.swift
//  WeatherTracker
//
//  Created by Amjad on 18/01/25.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText: String = ""
    @State private var searchIsActive: Bool = false
    @StateObject private var vm: WeatherViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                switch vm.viewState {
                case .empty:
                    WeatherEmptyView()
                case .savedCity:
                    WeatherCityView(weather: vm.weather)
                case .resultCard:
                    WeatherCardView(weather: vm.weather)
                        .gesture(
                            TapGesture()
                                .onEnded {
                                    vm.saveSelectedCity()
                                    vm.viewState = .savedCity
                                }
                        )
                }
            }
            .searchable(text: $searchText, prompt: "Search Location")
            .onChange(of: searchText, perform: { text in
                Task {
                    guard !text.isEmpty, text.count > 3 else { return }
                    await vm.fetchWeather(for: text)
                    vm.viewState = .resultCard
                }
            })
            .task {
                if let city = vm.getSavedCityName() {
                    await vm.fetchWeather(for: city)
                    vm.viewState = .savedCity
                }
            }
        }
    }
}

#Preview {
    WeatherView()
}
