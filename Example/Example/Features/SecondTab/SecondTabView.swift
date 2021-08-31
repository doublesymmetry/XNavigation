//
//  SecondTabView.swift
//  Example
//
//  Created by David Chavez on 31.08.21.
//

import SwiftUI
import XNavigation

struct SecondTabView: View {
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Button(action: {
                    navigation.present(SecondDetailModalView())
                }) { Text("Press to present!") }
            }
            .navigationBarTitle("Second Tab", displayMode: .large)
        }
    }
}

struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView()
    }
}
