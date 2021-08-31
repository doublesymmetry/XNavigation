//
//  SecondDetailModalView.swift
//  Example
//
//  Created by David Chavez on 31.08.21.
//

import SwiftUI
import XNavigation

struct SecondDetailModalView: View {
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Button(action: {
                    navigation.dismiss(animated: true)
                }) { Text("Press to dismiss!") }
                Button(action: {
                    navigation.pushView(SecondDetailModalDetailView())
                }) { Text("Press to push unto this modal!") }
                .padding(.top, 40)
            }
            .navigationBarTitle("Second Detail", displayMode: .inline)
        }
    }
}

struct SecondDetailModalView_Previews: PreviewProvider {
    static var previews: some View {
        SecondDetailModalView()
    }
}
