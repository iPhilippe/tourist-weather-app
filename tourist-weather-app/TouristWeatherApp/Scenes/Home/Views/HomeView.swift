//
//  HomeView.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            List(TouristPoint.allCases, id: \.self) { point in
                Button {
                    viewModel.pushDetailsView(point: point)
                } label: {
                    HStack {
                        Text(point.rawValue)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 2)
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
        }
    }
}
