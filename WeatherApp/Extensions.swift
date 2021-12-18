//
//  Extensions.swift
//  WeatherApp
//
//  Created by Kevin Tierney on 11/19/21.
//

import Foundation

extension DateFormatter {
    static let hourFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "ha"
        return formatter
    }()
    
    static let dayFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "E"
        return formatter
    }()
    
    static let dayNumberFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "D"
        return formatter
    }()
}

extension String{
    
    static func hour(from dt: Double) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        return DateFormatter.hourFormatter.string(from: date) 
        
    }
    
    static func day(from dt: Double)-> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        return DateFormatter.dayFormatter.string(from: date)
    }
    static func dayNumber(from dt: Double)-> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        return DateFormatter.dayNumberFormatter.string(from: date)
    }
}
