//
//  DetailViewHostingController.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 06/04/25.
//

import SwiftUI
import Combine

class DetailViewHostingController: BaseViewHostingController<DetailView> {

    init(view: DetailView) {
        super.init(rootView: view)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Previsão do ponto turístico"
        self.setupNavigationBar()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(backButtonClicked)
        )
    }
    
    @objc func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
}
