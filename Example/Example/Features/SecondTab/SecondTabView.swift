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
        VStack {
            Text("Second Tab!")
            Button(action: {
                navigation.present(SecondDetailView())
            }) { Text("Press to present!") }
        }
    }
}

struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView()
    }
}
