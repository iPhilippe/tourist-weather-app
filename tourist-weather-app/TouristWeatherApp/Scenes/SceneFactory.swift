//
//  SceneFactory.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//

import UIKit

protocol SceneFactory {
    associatedtype Dependencies
    static func make(with dependencies: Dependencies) -> UIViewController
}
