//
//  ContentView.swift
//  Example
//
//  Created by David Chavez on 11.11.20.
//

import SwiftUI
import XNavigation

struct ContentView: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
                .navigationBarTitle("Example", displayMode: .large)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
