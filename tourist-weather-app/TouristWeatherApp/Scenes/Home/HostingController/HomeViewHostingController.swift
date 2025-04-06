//
//  HomeViewHostingController.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 05/04/25.
//

import SwiftUI
import Combine

class HomeViewHostingController: BaseViewHostingController<HomeView> {
    
    init(view: HomeView) {
        super.init(rootView: view)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(.black)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Pontos Turísticos"
    }
}
