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
        Text("Implementar detalhes")
    }

    var loadingView: some View {
        ProgressView()
               .progressViewStyle(CircularProgressViewStyle())
               .scaleEffect(1.5)
               .tint(.white)
    }
}


