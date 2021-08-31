//
//  SecondDetailView.swift
//  Example
//
//  Created by David Chavez on 31.08.21.
//

import SwiftUI
import XNavigation

struct SecondDetailView: View {
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(action: {
            navigation.dismiss(animated: true)
        }) { Text("Press to dismiss!") }
    }
}

struct SecondDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SecondDetailView()
    }
}
