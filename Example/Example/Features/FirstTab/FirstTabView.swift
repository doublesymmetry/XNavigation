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
        VStack {
            Text("First Tab!")
            Button(action: {
                navigation.pushView(FirstDetailView(), animated: true)
            }) { Text("Press to push!") }
        }
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
