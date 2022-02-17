//
//  UIViewController+Hierarchy.swift
//  XNavigation
//
//  Created by David Chavez on 31.08.21.
//  Copyright © 2021 Double Symmetry UG. All rights reserved.
//

import UIKit

extension UIViewController {
    func findLastPresentedViewController() -> UIViewController? {
        if let presentedViewController = presentedViewController?.presentedViewController {
            return self.presentedViewController.findLastPresentedViewController()
        } else {
            return presentedViewController
        }
    }

    func findNestedUINavigationController() -> UINavigationController? {
        // presented modals should take precedence, as they're
        // currently on-screen and likely where you tried to push/present.
        if let lastPresentedViewController = findLastPresentedViewController() {
            return lastPresentedViewController.findNestedUINavigationController()
        }

        if let nvc = self as? UINavigationController { return nvc }
        else if let tbc = self as? UITabBarController {
            return tbc.selectedViewController?.findNestedUINavigationController()
        }

        for child in children {
            return child.findNestedUINavigationController()
        }

        return nil
    }
}
