//
//  UIDivider.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 07/04/25.
//

import SwiftUI

struct UIDivider: View {
    var color: Color = .white
    
    var body: some View {
        Divider()
            .frame(maxWidth: .infinity)
            .background(color)
    }
}
