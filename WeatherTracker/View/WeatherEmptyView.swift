//
//  WeatherEmptyView.swift
//  WeatherTracker
//
//  Created by Amjad on 18/01/25.
//

import SwiftUI

struct WeatherEmptyView: View {
    var body: some View {
        VStack {
            Text("No City Selected")
                .font(.custom("Poppins", size: 30))
                .fontWeight(.bold)
            
            Text("Please Search For A City")
                .font(.custom("Poppins", size: 15))
        }
        .padding(.bottom, 100)
    }
}

#Preview {
    WeatherEmptyView()
}
