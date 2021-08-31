//
//  FirstTabView.swift
//  Example
//
//  Created by David Chavez on 31.08.21.
//

import SwiftUI
import XNavigation

struct FirstTabView: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Button(action: {
                    navigation.pushView(FirstDetailView(), animated: true)
                }) { Text("Press to push!") }
            }
            .navigationBarTitle("First Tab", displayMode: .large)
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

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
