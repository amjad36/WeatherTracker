//
//  WeatherCityView.swift
//  WeatherTracker
//
//  Created by Amjad on 21/01/25.
//

import SwiftUI

struct WeatherCityView: View {
    let weather: Weather?
    
    var body: some View {
        VStack {
            AsyncImage(url: weather?.imageUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
            }
            HStack {
                Text(weather?.location.name ?? "")
                    .font(.system(size: 30))
                    .bold()
                Image(systemName: "location.fill")
                    .font(.system(size: 20))
            }
            Text("\(weather?.current.temprature ?? 0, specifier: "%.1f")°")
                .font(.system(size: 60))
            
            ZStack {
                Color(.background)
                    .frame(width: .infinity, height: 75)
                    .clipShape(.rect(cornerRadius: 16))
                HStack {
                    VStack {
                        Text("Humidity")
                        Text("\(weather?.current.humidity ?? 0, specifier: "%.1f")%")
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("UV")
                        Text("\(weather?.current.uvIndex ?? 0, specifier: "%.1f")")
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Feels Like")
                        Text("\(weather?.current.feelsLikeTemperature ?? 0, specifier: "%.1f")°")
                    }
                }
                .padding()
            }
            .padding(.horizontal, 56)
            
            Spacer()
        }
        .padding(.top, 50)
    }
}

#Preview {
    WeatherCityView(weather: Weather.data)
}
