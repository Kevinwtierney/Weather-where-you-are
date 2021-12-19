//
//  Models.swift
//  WeatherApp
//
//  Created by Kevin Tierney on 11/19/21.
//

import Foundation
import SwiftUI
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var headerViewModel = HeaderViewModel()
    @Published var hourlyData: [HourData] = []
    @Published var dailyData: [DayData] = []
    
    init(){
        fetchData()
    }
    
    func getImage(conditionId: Int, time: Double)-> String{
        
        
        
        var conditionname: String{
            switch conditionId{
            case 200...232:
                
                if time < headerViewModel.sunsetTime || time == 0{
                    return "cloud.bolt.fill"
                }
                else{
                    return "cloud.moon.bolt.fill"
                }
                
               case 300...321:
                
                   return "cloud.drizzle.fill"
                
               case 500...531:
                
                if time < headerViewModel.sunsetTime || time == 0{
                    return "cloud.rain.fill"
                }
                else{
                    return"cloud.moon.rain.fill"
                }
                
               case 600...622:
                
                   return "cloud.snow.fill"
                
               case 701...781:
                
                   return "cloud.fog.fill"
                
               case 800:
                if time < headerViewModel.sunsetTime || time == 0{
                    return"sun.max.fill"}
                else{
                        return "moon.fill"
                    }
               case 801...804:
                if time < headerViewModel.sunsetTime || time == 0{
                    return "cloud.fill"
                }
                else{
                    return"cloud.moon.fill"
                }
                
               default:
                   return "cloud.fill"
            
            }
        }
       return conditionname
    }

    func fetchData(){
        
        
        LocationManager.shared.getLocation { location in
            LocationManager.shared.resolveName(for: CLLocation(latitude: location.lat, longitude: location.lon)) { name in
                DispatchQueue.main.async {
                    self.headerViewModel.location = name ?? "current"
                }
            }
            
            let urlString = "https:api.openweathermap.org/data/2.5/onecall?lat=\(location.lat)&lon=\(location.lon)&exclude=minutely&units=imperial&appid=bb553aac2f032a3edbc7a632ca19eccb"
              
              guard let url = URL(string: urlString) else{
                  return
              }
            print(url)
              
              let task = URLSession.shared.dataTask(with: url){ data,  _, error in
                  guard let data = data, error == nil else{
                      return
                  }
                  
                  do{
                     let result = try JSONDecoder().decode(APIResponse.self, from: data)
                      
                      DispatchQueue.main.async {
                          
                          // Current
                          
                          let currentConditionid = result.current.weather.first?.id ?? 200
                          self.headerViewModel.currentTemp = "\(Int(result.current.temp))°"
                          self.headerViewModel.currentCondition = result.current.weather.first?.main ?? "-"
                          self.headerViewModel.conditionImage = self.getImage(conditionId: currentConditionid, time: result.current.dt)
                          self.headerViewModel.sunsetTime = result.current.sunset
                          self.headerViewModel.currentTime = result.current.dt
                          
                          
                          // Daily
                          
                          self.dailyData = result.daily.compactMap({
                              let data = DayData()
                              let currentTime = result.current.dt
                              data.High = "\(Int($0.temp.max))°F"
                              data.Low = "\(Int($0.temp.min))°F"
                              data.pop = Int($0.pop * 100)
                              if String.dayNumber(from: $0.dt) == String.dayNumber(from: currentTime) {
                                  data.Day = "Today"
                              }
                              else{
                                  data.Day = String.day(from: $0.dt)
                              }
                              
                              data.imageURL = self.getImage(conditionId: $0.weather.first?.id ?? 200, time: 0)
                              return data
                          })
                          
                          // Hourly
                          self.hourlyData = result.hourly.compactMap({
                              let data = HourData()
                              let currentTime = result.current.dt
                              data.temp  = "\(Int($0.temp))°"
                              data.pop = Int($0.pop * 100)
                              if String.hour(from: $0.dt) == String.hour(from: currentTime){
                                  data.hour = "Now"
                              }
                              else{
                                  data.hour = String.hour(from: $0.dt)
                              }
                              
                              data.imageURL = self.getImage(conditionId: $0.weather.first?.id ?? 200, time:$0.dt)
                              return data
                          })
                          print("refreshed")
                      }
                     
                      return
                  }
                  catch{
                      print(error)
                  }
                  
              }
              task.resume()
            
        }
    
        // get data and location information
    }
    
}

// MARK: - Header

class HeaderViewModel: ObservableObject {
    var location: String = "San Jose, Ca"
    var currentTemp = "75°"
    var currentCondition = "Clear"
    var conditionImage = "cloud.sun.fill"
    var sunsetTime = 65353453453.453
    var currentTime = 6345345345.345
    
}

// MARK: - Hourly

class HourData: ObservableObject, Identifiable {
    var id = UUID()
    var temp = "75°"
    var hour = "6PM"
    var imageURL = "cloud.sun.fill"
    var pop = 50
}

// MARK: - Daily

class DayData: ObservableObject,Identifiable {
    var id = UUID()
    var Day = "Monday"
    var High = "72°"
    var Low = "55°"
    var imageURL = "cloud.sun.fill"
    var pop = 50
}
