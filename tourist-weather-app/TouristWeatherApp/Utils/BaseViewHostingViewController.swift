//
//  BaseViewHostingViewController.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//

import SwiftUI
import UIKit

class BaseViewHostingController<T: View> : UIHostingController<T> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.black
        self.setupNavigationBarAppearance()
    }
    
    func setupNavigationBarAppearance(color: Color = .black, transparent: Bool = false) {
        // Title text attributes
        let standardTextAttributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 15),
            .foregroundColor: UIColor.white
        ]

        let largeTextAttributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 30),
            .foregroundColor: UIColor.white
        ]
        
        // Appearances
        let opaqueAppearance = UINavigationBarAppearance()
        opaqueAppearance.configureWithOpaqueBackground()
        opaqueAppearance.shadowColor = nil
        opaqueAppearance.titleTextAttributes = standardTextAttributes
        opaqueAppearance.largeTitleTextAttributes = largeTextAttributes
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.standardAppearance = opaqueAppearance
        
        if transparent {
            let transparentAppearance = UINavigationBarAppearance()
            transparentAppearance.configureWithTransparentBackground()
            transparentAppearance.titleTextAttributes = [.foregroundColor: UIColor.clear]
            transparentAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.clear]
            self.navigationController?.navigationBar.scrollEdgeAppearance = transparentAppearance
        } else {
            self.navigationController?.navigationBar.scrollEdgeAppearance = nil
        }
        
        self.navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
        self.navigationController?.navigationItem.backButtonDisplayMode = .minimal
    }
}

