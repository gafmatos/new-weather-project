//
//  ContentView.swift
//  new-weatherapp
//
//  Created by Gabriel Matos on 26/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [Color.blue, Color.white], startPoint:.top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            ScrollView(.vertical, showsIndicators: false){
                VStack {
                    Text("Chapel Hill")
                        .font(.largeTitle)
                    Text("67°")
                        .font(.system(size: 100))
                        .fontWeight(.light)
                        .padding(.bottom)
                    Text("Sunny")
                        .font(.callout)
                        .fontWeight(.light)
                        .foregroundStyle(Color(red: 0.8, green: 0.8, blue: 0.9))
                    HourlyForecast()
                    TenDayForecast()
                    
                    
                    
                }
                .foregroundStyle(Color.white)
                .padding()
                
            }
        }
    }
    
    struct HourlyForecast: View{
        var body: some View{
            
            VStack{
                HStack{
                    Image(systemName: "clock")
                    Text("HOURLY FORECAST")
                    Spacer()
                    
                }
                .padding(.bottom,5)
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack(spacing: 10){
                        
                        HourlyForecastBar(hour: "Now", weather: "sun.max.fill", temp: 55)
                        
                        ForEach(0..<24){i in
                            
                            
                            if i > 12{
                                HourlyForecastBar(hour: "\(i-12)PM", weather: getWeatherIcon(), temp: Int.random(in: 40...70) )
                            }
                            else{
                                HourlyForecastBar(hour: "\(i)AM", weather: getWeatherIcon(), temp: Int.random(in: 40...70) )
                            }
                            
                        }}
                    .bold(true)
                    
                    
                    
                }
                
                
                
            }
            .padding(15)
            .background(Color.blue.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        
        func getWeatherIcon()->String{
            
            let number = Int.random(in: 1...3)
            
            if number == 1{
                return "sun.max.fill"
            }
            else if number == 2{
                return "cloud.fog.fill"
            }
            else{
                return "cloud.fill"
            }
        }
    }
    
    
    
    struct HourlyForecastBar: View{
        var hour: String
        var weather: String
        var temp: Int
        var body: some View{
            VStack{
                Text(hour)
                Image(systemName: weather)
                    .font(.system(size: 20))
                    .frame(width: 20, height: 20)
                    .foregroundStyle(weather == "sun.max.fill" ? Color.yellow: Color.white)
                Text("\(temp)°")
            }
        }
    }
    
    struct TenDayForecast: View{
        
        var body: some View{
            VStack{
                HStack{Image(systemName:"calendar")
                    Spacer()
                }
                .padding(.bottom, 10)
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(0..<10){i in
                        TenDayForecastRow(day: "Hello", weather: "sun.max.fill", temp1: 5, temp2: 5)
                    }
                }
            
        }
            .padding(15)
            .background(Color.blue.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
    
    
    struct TenDayForecastRow: View{
        var day: String
        var weather: String
        var temp1: Int
        var temp2: Int
        
        var body: some View{
            HStack(spacing: 80){
                Text(day)
                    .bold(true)
                Image(systemName: weather)
                Text("\(temp1)")
                Text("\(temp2)")
            }
            .padding(.bottom)
            }
    }
}

#Preview {
    ContentView()
}
