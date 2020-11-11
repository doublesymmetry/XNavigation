//
//  NavigationBarTitleConfiguration.swift
//  XNavigation
//
//  Created by David Chavez on 11.11.20.
//  Copyright © 2020 Double Symmetry UG. All rights reserved.
//

import SwiftUI

public struct NavigationBarTitleConfiguration {
    public let title: String
    public let displayMode: NavigationBarItem.TitleDisplayMode

    public init(title: String, displayMode: NavigationBarItem.TitleDisplayMode) {
        self.title = title
        self.displayMode = displayMode
    }
}
