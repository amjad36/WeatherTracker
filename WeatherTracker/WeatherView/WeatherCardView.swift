//
//  WeatherCardView.swift
//  WeatherTracker
//
//  Created by Amjad on 18/01/25.
//

import SwiftUI

struct WeatherCardView: View {
    let weather: Weather?
    
    var body: some View {
        ZStack {
            Color(.background)
                .frame(width: .infinity, height: 117)
                .clipShape(.rect(cornerRadius: 16))
            HStack {
                VStack {
                    Text(weather?.location.name ?? "")
                        .font(.system(size: 20))
                        .bold()
                    Text("\(weather?.current.temprature ?? 0, specifier: "%.1f")°")
                        .font(.system(size: 60))
                }
                
                Spacer()
                
                AsyncImage(url: weather?.imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
            }
            .padding()
        }
        .padding(.horizontal)
        
        Spacer()
    }
}

#Preview {
    WeatherCardView(weather: Weather.data)
}
