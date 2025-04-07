//
//  DetailView.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 06/04/25.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                loadingView
            } else {
                content
            }
        }
    }
    
    var content: some View {
        Group {
            if let touristPoints = viewModel.touristPoints, viewModel.error == false {
                VStack(alignment: .leading, spacing: 10) {
                    Text(touristPoints.point.rawValue)
                    UIDivider()
                    
                    Text(touristPoints.point.description())
                    UIDivider()
                    
                    Text("Temperatura: \(String(format: "%.1f", touristPoints.weatherInfo.main.tempCelsius)) °C")
                    UIDivider()
                    
                    Text("Sensação Térmica: \(String(format: "%.1f", touristPoints.weatherInfo.main.feelsLikeCelsius)) °C")
                    UIDivider()
                    
                    Text("Temperatura Mínima: \(String(format: "%.1f", touristPoints.weatherInfo.main.tempMinCelsius)) °C")
                    UIDivider()
                    
                    Text("Temperatura Máxima: \(String(format: "%.1f", touristPoints.weatherInfo.main.tempMaxCelsius)) °C")
                    Spacer()
                }
                .foregroundStyle(Color.white)
            } else {
                VStack(alignment: .center, spacing: 10) {
                    Text("Não foi pssível carregar as informações \n Tente novamente mais tarde")
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                    Image("error")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                }
            }
        }
        .padding(.horizontal)
    }
    
    var loadingView: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(1.5)
            .tint(.white)
    }
}
