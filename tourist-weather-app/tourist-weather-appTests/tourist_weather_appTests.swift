//
//  tourist_weather_appTests.swift
//  tourist-weather-appTests
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//

import XCTest
@testable import tourist_weather_app

final class tourist_weather_appTests: XCTestCase {
    
    func testGetTouristPointsList_onInit_shouldFillTouristPointList() {
        let viewModel = HomeViewModel()
        XCTAssertFalse(viewModel.touristPointList.isEmpty, "A lista de pontos turísticos deveria estar preenchida após a inicialização.")
    }
    
    func testOnChangeOfSearchText_withMatchingText_shouldFilterList() {
        let viewModel = HomeViewModel()
        viewModel.getTouristPointsList()
        
        let fullList = viewModel.touristPointList
        let searchTerm = "Cristo"
        viewModel.onChangeOfSearchText(text: searchTerm)
        
        XCTAssertTrue(viewModel.touristPointList.count < fullList.count, "A lista deveria ter sido filtrada.")
        XCTAssertTrue(viewModel.touristPointList.contains(where: { $0.rawValue.contains("Cristo") }), "A lista filtrada deveria conter 'Cristo'.")
    }
    
    func testOnChangeOfSearchText_withEmptyText_shouldResetList() {
        let viewModel = HomeViewModel()
        viewModel.onChangeOfSearchText(text: "lsjdklsjflksjfklsjflsjflskjflksfj")
        let filteredList = viewModel.touristPointList
        
        viewModel.onChangeOfSearchText(text: "")
        let resetList = viewModel.touristPointList
        
        XCTAssertTrue(resetList.count >= filteredList.count, "A lista deveria voltar ao estado original com texto vazio.")
    }
}
