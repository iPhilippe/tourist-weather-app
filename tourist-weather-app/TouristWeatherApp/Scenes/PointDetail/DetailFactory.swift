//
//  DetailFactory.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 06/04/25.
//

import Foundation
import UIKit

final class DetailFactory: SceneFactory {
    
    struct Dependencies {
        var point: TouristPoint
    }
    
    static func make(with dependencies: Dependencies) -> UIViewController {
        let viewModel = DetailViewModel(touristPoint: dependencies.point)
        
        let view = DetailView(viewModel: viewModel)
        
        let detailVC = DetailViewHostingController(view: view)
        
        return detailVC
    }
}
