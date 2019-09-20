//
//  Weather.swift
//  GoodWeather
//
//  Created by Lucas Silveira on 19/09/19.
//  Copyright © 2019 Lucas Silveira. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
  let main: Weather
}

struct Weather: Decodable {
  var temp: Double?
  var humidity: Double?
}
