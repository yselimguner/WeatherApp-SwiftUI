 //
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by iOS PSI on 2.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,  bottomColor: isNight ? .gray : Color("lightBlue"))//Bütün ekranı kaplarız.
            VStack{
                CityTextView(cityName: "Istanbul,Turkey")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", tempature: 76)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 85)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 50)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 70)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 40)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label:{
                    WeatherButton(title: "Change Day Time",
                                  textColor: isNight ? .black : .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack(spacing: 3){
            Text(dayOfWeek)
                .font(.system(size: 20,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original) //rengini ayarlamak için yazarız.
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text("\(temperature)°")
                .font(.system(size: 25,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor:Color
    var bottomColor:Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView:View{
    
    var cityName:String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding(.bottom)
    }
}

struct MainWeatherStatusView:View{
    var imageName:String
    var tempature:Int
    
    var body : some View{
        VStack(spacing: 8){ //Line boşluklarından bahsediyoruz.
            Image(systemName: imageName)
                .renderingMode(.original) //rengini ayarlamak için yazarız.
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(tempature)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


