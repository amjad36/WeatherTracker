//
//  WeatherTrackerTests.swift
//  WeatherTrackerTests
//
//  Created by Amjad on 17/01/25.
//

import XCTest
@testable import WeatherTracker

final class WeatherTrackerTests: XCTestCase {
    
    var sut: WeatherViewModel?

    override func setUpWithError() throws {
        sut = WeatherViewModel()
    }
    
    func testCityAPI() {
        let expectation = self.expectation(description: "Fetch weather data for New Delhi")
        Task {
            await sut?.fetchWeather(for: "New Delhi")
            XCTAssertNotNil(sut?.weather)
            XCTAssertEqual(sut?.weather?.location.name, "New Delhi")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testSaveCityName() {
        sut?.weather = Weather.data
        sut?.saveSelectedCity()
        XCTAssertEqual(UserDefaults.standard.string(forKey: Constants.cityNameKey), "New York")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
}
