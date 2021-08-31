//
//  ExampleView.swift
//  Example
//
//  Created by David Chavez on 31.08.21.
//

import SwiftUI
import XNavigation

struct ExampleView: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        NavigationView {
            TabView {
                FirstTabView()
                    .tabItem {
                        Label("First", systemImage: "01.circle.fill")
                    }

                SecondTabView()
                    .tabItem {
                        Label("Second", systemImage: "02.circle.fill")
                    }
            }
            .navigationBarTitle("TabExample", displayMode: .large)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        navigation.pushView(SettingsView(), animated: true)
                    }) { Image(systemName: "gear") }
                }
            }
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
