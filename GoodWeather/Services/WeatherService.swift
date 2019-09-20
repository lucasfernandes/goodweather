//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Lucas Silveira on 19/09/19.
//  Copyright © 2019 Lucas Silveira. All rights reserved.
//

import Foundation

class WeatherService {
  func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
    guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=6221995e0cfe1b9325b67e0f667ca054") else {
      completion(nil)
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      guard let data = data, error == nil else {
        completion(nil)
        return
      }
      
      let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
      if let weatherResponse = weatherResponse {
        let weather = weatherResponse.main
        completion(weather)
      } else {
        completion(nil)
      }
    }.resume()
  }
}
