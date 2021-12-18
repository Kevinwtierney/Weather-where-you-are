//
//  APIModels.swift
//  WeatherApp
//
//  Created by Kevin Tierney on 11/19/21.
//

import Foundation

struct APIResponse: Codable {
    let lat : Double
    let lon : Double
    let current : Current
    let hourly : [HourlyModel]
    let daily : [DayModel]
}

struct Current: Codable{
    let temp : Double
    let dt: Double
    let sunset: Double
    let weather : [Info]
    
}
struct HourlyModel: Codable{
    let dt: Double
    let temp : Double
    let weather : [Info]
}

struct Info: Codable{
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}

struct DayModel: Codable{
    let dt: Double
    let temp : Temp
    let weather : [Info]
}

struct Temp: Codable{
    let min : Double
    let max : Double
}
