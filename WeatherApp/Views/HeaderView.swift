//
//  HeaderView.swift
//  WeatherApp
//
//  Created by Kevin Tierney on 11/19/21.
//

import SwiftUI

struct HeaderView: View{
    
    @EnvironmentObject var viewModel: WeatherViewModel
    var body: some View {
        
        VStack(spacing: -15){
            
            Text(viewModel.headerViewModel.location)
                .foregroundColor(.white)
                .font(.system(size: 36))
                .padding()
            Text("Tap anywhere to Refresh")
                .foregroundColor(.white)
                .padding(.bottom,3)
            
            Image(systemName: viewModel.headerViewModel.conditionImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            
            Text(viewModel.headerViewModel.currentTemp)
                .foregroundColor(.white)
                .font(.system(size: 90))
                .fontWeight(.thin)
                .padding(.top,10)
            
            Text("\(viewModel.headerViewModel.currentCondition)  ")
                .foregroundColor(.white)
                .font(.system(size: 36))
                .fontWeight(.thin)
                .padding(.bottom,10)
        }
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .preferredColorScheme(.dark)
    }
}
