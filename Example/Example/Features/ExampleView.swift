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
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
