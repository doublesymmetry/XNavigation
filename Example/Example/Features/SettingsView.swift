//
//  SettingsView.swift
//  Example
//
//  Created by David Chavez on 11.11.20.
//

import SwiftUI
import XNavigation
import SafariServices

struct SettingsView: View, DestinationView {
    @EnvironmentObject var navigation: Navigation

    var navigationBarTitleConfiguration = NavigationBarTitleConfiguration(title: "Settings", displayMode: .inline)

    var body: some View {
        VStack {
            Text("Settings View")
            Button(action: {
                if let url = URL(string: "https://doublesymmetry.com") {
                    let config = SFSafariViewController.Configuration()
                    config.entersReaderIfAvailable = true

                    let vc = SFSafariViewController(url: url, configuration: config)
                    navigation.present(vc, animated: true)
                }
            }) { Text("Open website!") }
        }
        .navigationBarTitle(configuration: navigationBarTitleConfiguration)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
