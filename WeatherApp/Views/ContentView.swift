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
                if viewModel.headerViewModel.currentCondition == "Clear"{
                    LinearGradient(gradient: Gradient(colors: [.blue, Color(.link), .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                }
                else{
                    LinearGradient(gradient: Gradient(colors: [Color(.darkGray), Color(.gray), Color(.lightGray)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                }
               
                
                
                ScrollView(.vertical){
                    
                    
                    VStack{
//                        HStack{
//                            Button {
//                                viewModel.fetchData()
//                            } label: {
//                                Image(systemName: "arrow.clockwise")
//                                    .frame(width: 50, height: 50, alignment: .center)
//                                    .background(LinearGradient(gradient: Gradient(colors: [.orange, Color(.gray), .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                                                    .edgesIgnoringSafeArea(.all))
//                                    .cornerRadius(25)
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 30))
//                                    .padding(.top)
//                            }
//                            .padding(.leading, 10)
//                            
//                            Spacer()
//                            
//                        }
         
                        HeaderView()
                            .padding(.top,20)
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
                                Text("7-DAY FORECAST:")
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
                .onTapGesture {
                    viewModel.fetchData()
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
