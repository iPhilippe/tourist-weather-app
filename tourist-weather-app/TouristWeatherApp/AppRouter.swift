//
//  AppRouter.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//

import UIKit
import SwiftUI
import CoreSpotlight

final class AppRouter: ObservableObject {
    
    init() {}
    
    func getAppRootViewController() -> UIViewController {
        return MainFactory.make(with: .init())
    }
}

