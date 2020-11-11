//
//  SettingsView.swift
//  Example
//
//  Created by David Chavez on 11.11.20.
//

import SwiftUI
import XNavigation

struct SettingsView: View, DestinationView {
    var navigationBarTitleConfiguration = NavigationBarTitleConfiguration(title: "Settings", displayMode: .inline)

    var body: some View {
        Text("Settings View")
            .navigationBarTitle(configuration: navigationBarTitleConfiguration)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
