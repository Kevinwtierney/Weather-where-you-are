//
//  ContentView.swift
//  WeatherApp
//
//  Created by Kevin Tierney on 11/19/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: WeatherViewModel

    var body: some View {
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue, Color(.link), .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical){
                    
                    VStack{
                        HStack{
                            Button {
                                viewModel.fetchData()
                            } label: {
                                Image(systemName: "arrow.clockwise")
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .background(LinearGradient(gradient: Gradient(colors: [.orange, Color(.gray), .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                                    .edgesIgnoringSafeArea(.all))
                                    .cornerRadius(25)
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                                    .padding(.top)
                            }
                            .padding(.leading, 10)
                            
                            Spacer()
                            
                        }
         
                        HeaderView()
                        VStack{
                            HourlyView()
                        }
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        .padding()
                        

                        VStack{
                            
                            HStack{
                                Image(systemName: "calendar")
                                    .foregroundColor(.white)
                                Text("7-Day Forcast:")
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding()
                            DailyView()
                        }
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        .padding()
         
                        Spacer()
                    }
                    
                }
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
