//
//  HomeRouter.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//
import UIKit

enum HomeRoutingDestination {
    case weatherDetails(point: TouristPoint)
}

final class HomeRouter {
    weak var viewController: UIViewController?
    
    func route(to destination: HomeRoutingDestination) {
        switch destination {
        case .weatherDetails(let point):
            pushDetailsView(point: point)
        }
    }
}


// MARK: Navigation Functions
extension HomeRouter {
    private func pushDetailsView(point: TouristPoint) {
        let detailVC = DetailFactory.make(with: .init(point: point))
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
