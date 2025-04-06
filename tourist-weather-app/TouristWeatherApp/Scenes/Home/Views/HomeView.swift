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
        Text("Hello, World!")
            .foregroundStyle(Color.white)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
