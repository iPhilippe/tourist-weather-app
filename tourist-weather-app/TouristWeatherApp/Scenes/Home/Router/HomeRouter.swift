//
//  HomeRouter.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//
import UIKit

enum HomeRoutingDestination {
    case weatherDetails
}

final class HomeRouter {
    weak var viewController: UIViewController?
    
    func route(to destination: HomeRoutingDestination) {
        switch destination {
        case .weatherDetails:
            pushDetailsView()
        }
    }
}


// MARK: Navigation Functions
extension HomeRouter {
    private func pushDetailsView() {
    }
}
