//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Kevin Tierney on 11/19/21.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = WeatherViewModel()
            ContentView().environmentObject(viewModel)
                
            
        }
        
    }
}
