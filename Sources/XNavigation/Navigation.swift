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

    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        if let modal = window.rootViewController?.presentedViewController {
            modal.dismiss(animated: animated, completion: completion)
        } else {
            window.rootViewController?.dismiss(animated: animated, completion: completion)
        }
    }

    public func present<Content: View>(_ view: Content, animated: Bool = true) {
        let controller = DestinationHostingController(rootView: view.environmentObject(self))
        present(controller, animated: animated)
    }

    public func present(_ viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async { [weak self] in
            if let modal = self?.window.rootViewController?.presentedViewController {
                modal.present(viewController, animated: animated)
            } else {
                self?.window.rootViewController?.present(viewController, animated: animated)
            }
        }
    }

    public func pop(animated: Bool = true) {
        var nvc = window.rootViewController?.children.first?.children.first as? UINavigationController

        if UIDevice.current.userInterfaceIdiom == .phone {
            if let modal = window.rootViewController?.presentedViewController?.presentedViewController {
                nvc = modal.children.first as? UINavigationController
            }
        } else {
            if let modal = window.rootViewController?.presentedViewController {
                nvc = modal.children.first as? UINavigationController
            }
        }

        nvc?.popViewController(animated: animated)
    }

    public func pushView<Content: View>(_ view: Content, animated: Bool = true) {
        let controller = DestinationHostingController(rootView: view.environmentObject(self))
        pushViewController(controller, animated: animated)
    }

    public func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        var nvc = window.rootViewController?.children.first?.children.first as? UINavigationController
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            if let modal = window.rootViewController?.presentedViewController?.presentedViewController {
                nvc = modal.children.first as? UINavigationController
            }
        } else {
            if let modal = window.rootViewController?.presentedViewController {
                nvc = modal.children.first as? UINavigationController
            }
        }

        DispatchQueue.main.async {
            nvc?.pushViewController(viewController, animated: animated)
        }
    }
}
