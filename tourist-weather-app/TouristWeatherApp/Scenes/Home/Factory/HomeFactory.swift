//
//  HomeFactory.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//


import Foundation
import UIKit

final class HomeFactory: SceneFactory {
    
    struct Dependencies {}
    
    static func make(with dependencies: Dependencies) -> UIViewController {
        
        let viewModel = HomeViewModel()
        
        let router = HomeRouter()
        viewModel.router = router
        
        let view = HomeView(viewModel: viewModel)
        
        let homeVC = HomeViewHostingController(view: view)
        router.viewController = homeVC
        
        return homeVC
    }
}
