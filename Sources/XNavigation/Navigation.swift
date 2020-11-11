//
//  Navigation.swift
//  XNavigation
//
//  Created by David Chavez on 11.11.20.
//  Copyright © 2020 Double Symmetry UG. All rights reserved.
//

import SwiftUI
import Combine

open class Navigation: ObservableObject {
    public let window: UIWindow

    public init(window: UIWindow) {
        self.window = window
    }

    public func present(_ viewController: UIViewController, animated: Bool = true) {
        window.rootViewController?.present(viewController, animated: animated)
    }

    public func pushView(_ view: AnyView, animated: Bool = true) {
        let controller = DestinationHostingController(rootView: view.environmentObject(self))
        pushViewController(controller, animated: animated)
    }

    public func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        let nvc = window.rootViewController?.children.first?.children.first as? UINavigationController
        nvc?.pushViewController(viewController, animated: animated)
    }
}

