//
//  HourlyView.swift
//  WeatherApp
//
//  Created by Kevin Tierney on 11/19/21.
//

import SwiftUI

struct HourlyView: View{
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View{
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(viewModel.hourlyData.prefix(12)){ model in
                    HourView(model: model)
                    
                }
                
            }
        }
    }
}

struct HourView: View {
    
    var model: HourData
    var body: some View{
        
        VStack{
            
            Text(model.hour)
                .foregroundColor(.white)
          
            Image(systemName: model.imageURL)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30 , height: 30, alignment: .center)
              
            
            if model.pop > 10 {
                Text("\(model.pop)% ")
                    .foregroundColor(.cyan)
                    .padding(.bottom,3)
            }
            
            Text(model.temp)
                .foregroundColor(.white)
            
        }
        .padding()
        
    }
}




struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView()
            .preferredColorScheme(.dark)
    }
}
