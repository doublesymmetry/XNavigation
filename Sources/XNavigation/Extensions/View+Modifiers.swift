//
//  View+Modifiers.swift
//  XNavigation
//
//  Created by David Chavez on 11.11.20.
//  Copyright © 2020 Double Symmetry UG. All rights reserved.
//

import SwiftUI

struct NavigationBarTitle: ViewModifier {
    var configuration: NavigationBarTitleConfiguration

    func body(content: Content) -> some View {
        content
            .navigationBarTitle(configuration.title, displayMode: configuration.displayMode)
    }
}


public extension View {
    func navigationBarTitle(configuration: NavigationBarTitleConfiguration) -> some View {
        self.modifier(NavigationBarTitle(configuration: configuration))
    }
}
