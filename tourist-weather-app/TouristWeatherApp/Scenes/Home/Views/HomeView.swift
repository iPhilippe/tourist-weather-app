//
//  HomeView.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                loadingView
            } else {
                content
            }
        }.onAppear {
            viewModel.getWeatherData(local: .vista_chinesa)
        }
    }
    
    var content: some View {
        VStack {
            Text("Hello, World!")
                .foregroundStyle(.white)
                .font(.largeTitle)
        }
    }
    
    var loadingView: some View {
        ProgressView()
               .progressViewStyle(CircularProgressViewStyle())
               .scaleEffect(1.5)
               .tint(.white)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
