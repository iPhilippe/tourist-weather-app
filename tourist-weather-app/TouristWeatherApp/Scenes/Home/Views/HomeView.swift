//
//  HomeView.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @FocusState private var isSearchFocused: Bool
    @State private var searchText: String = ""
    @State private var showCleanTextButton: Bool = false
    
    private let placeholderText: String = "Pesquise por pontos turísticos"
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                seachTextField()
                
                List(viewModel.touristPointList, id: \.self) { point in
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
    
    
    private func seachTextField() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                TextField(
                    "",
                    text: $searchText
                )
                .focused($isSearchFocused)
                .foregroundColor(.black)
                .padding(.horizontal, 12)
                .frame(height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                )
                .frame(maxWidth: .infinity)
                .submitLabel(.done)
                
                if searchText.textForSearch().isEmpty {
                    Text(placeholderText)
                        .foregroundStyle(Color.gray)
                        .padding(.horizontal, 8)
                }
            }
            
            if showCleanTextButton {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 20, height: 20)
                    .onTapGesture {
                        self.searchText = ""
                        self.isSearchFocused = true
                    }
                    .transition(.opacity)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
        .padding(.bottom, 8)
        .contentShape(RoundedRectangle(cornerRadius: 8))
        .onTapGesture {
            isSearchFocused = true
        }
        .onChange(of: searchText) {
            viewModel.onChangeOfSearchText(text: searchText)
            withAnimation(.easeInOut(duration: 0.2)) {
                showCleanTextButton = !searchText.isEmpty
            }
        }
    }
    
}
