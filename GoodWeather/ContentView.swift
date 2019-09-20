//
//  ContentView.swift
//  GoodWeather
//
//  Created by Lucas Silveira on 19/09/19.
//  Copyright © 2019 Lucas Silveira. All rights reserved.
//

import SwiftUI

struct ContentView : View {
  @ObservedObject var weatherVM: WeatherViewModel
  
  init() {
    self.weatherVM = WeatherViewModel()
  }

  var body: some View {
    VStack(alignment: .center) {
      TextField("Enter city name", text:
      self.$weatherVM.cityName) {
        self.weatherVM.search()
      }.font(.custom("Arial", size: 50))
        .padding()
        .fixedSize()
      
      Text(self.weatherVM.temperature)
        .font(.custom("Arial", size: 100))
      .offset(y: 100)
      .foregroundColor(Color.white)
      .offset(y: -100)
      .padding()
    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(Color.green).edgesIgnoringSafeArea(.all)
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
