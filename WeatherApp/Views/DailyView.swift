//
//  DailyView.swift
//  WeatherApp
//
//  Created by Kevin Tierney on 11/19/21.
//

import SwiftUI

struct DailyView: View{
    
    @EnvironmentObject var viewModel: WeatherViewModel
    var body: some View{
        
        VStack{
            ForEach(viewModel.dailyData) {model in
              
                DayRowView(model: model)
                    .padding()
            }
        }
    }
}

struct DayRowView: View{
    
    var model: DayData
    var body: some View{
        
        HStack{
            
            Spacer()
            
            Text(model.Day)
                .bold()
                .font(.system(size: 24))
                .foregroundColor(.white)
                .frame(width: 100, height: 50, alignment: .center)
            
            Spacer()
            
            HStack{
                Spacer()
                Image(systemName: model.imageURL)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35 , height: 35, alignment: .center)
                
                Spacer()
              
                Text("H:\(model.High) ")
                    .foregroundColor(.white)
                
                Text("L:\(model.Low)")
                    .foregroundColor(.white)
                
                Spacer()
                
            }
        }
        
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
            .preferredColorScheme(.dark)
    }
}
