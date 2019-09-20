//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Lucas Silveira on 19/09/19.
//  Copyright © 2019 Lucas Silveira. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class WeatherViewModel: ObservableObject {

  private var weatherService: WeatherService
  
  @Published var weather = Weather()

  init() {
    self.weatherService = WeatherService()
  }
  
  var temperature: String {
    if let temp = self.weather.temp {
      let celsius = temp - 273.15
      return String(format: "%.0f", celsius) + "°c"
    } else {
      return ""
    }
  }
  
  var humidity: String {
    if let humidty = self.weather.humidity {
      return String(format: "%.0f", humidty)
    } else {
      return ""
    }
  }
  
  var cityName: String = ""
  
  func search() {
    if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
      fetchWeather(by: city)
    }
  }
  
  private func fetchWeather(by city: String) {
    self.weatherService.getWeather(city: city) { weather in
      if let weather = weather {
        DispatchQueue.main.async {
          self.weather = weather
        }
      }
    }
  }
}
