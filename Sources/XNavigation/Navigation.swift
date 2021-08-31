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

    public func present<Content: View>(_ view: Content, animated: Bool = true) {
        let controller = DestinationHostingController(rootView: view.environmentObject(self))
        present(controller, animated: animated)
    }

    public func present(_ viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async { [weak self] in
            if let lastPresentedViewController = self?.window.rootViewController?.findLastPresentedViewController() {
                lastPresentedViewController.present(viewController, animated: animated)
            } else {
                self?.window.rootViewController?.present(viewController, animated: animated)
            }
        }
    }

    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            if let lastPresentedViewController = self?.window.rootViewController?.findLastPresentedViewController() {
                lastPresentedViewController.dismiss(animated: animated, completion: completion)
            } else {
                self?.window.rootViewController?.dismiss(animated: animated, completion: completion)
            }
        }
    }

    public func pushView<Content: View>(_ view: Content, animated: Bool = true) {
        let controller = DestinationHostingController(rootView: view.environmentObject(self))
        pushViewController(controller, animated: animated)
    }

    public func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        let nvc = window.rootViewController?.findNestedUINavigationController()

        DispatchQueue.main.async {
            nvc?.pushViewController(viewController, animated: animated)
        }
    }

    public func pop(animated: Bool = true) {
        let nvc = window.rootViewController?.findNestedUINavigationController()

        DispatchQueue.main.async {
            nvc?.popViewController(animated: animated)
        }
    }
}
