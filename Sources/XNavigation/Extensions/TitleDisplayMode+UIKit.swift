//
//  TitleDisplayMode+UIKit.swift
//  XNavigation
//
//  Created by David Chavez on 11.11.20.
//  Copyright © 2020 Double Symmetry UG. All rights reserved.
//

import SwiftUI
import UIKit

extension NavigationBarItem.TitleDisplayMode {
    var uikitDisplayMode: UINavigationItem.LargeTitleDisplayMode {
        switch self {
        case .automatic: return .automatic
        case .inline: return .never
        case .large: return .always
        @unknown default: return .automatic
        }
    }
}
