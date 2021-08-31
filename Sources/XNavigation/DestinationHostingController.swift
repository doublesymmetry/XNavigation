//
//  DestinationHostingController.swift
//  XNavigation
//
//  Created by David Chavez on 11.11.20.
//  Copyright © 2020 Double Symmetry UG. All rights reserved.
//

import SwiftUI

open class DestinationHostingController<T: View>: UIHostingController<T> {
    open override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)

        if parent == nil {
            let itemsInStackCount = navigationController?.children.count ?? 0
            if navigationController?.children[itemsInStackCount - 2].toolbarItems?.isEmpty == false {
                navigationController?.isToolbarHidden = false
            }
        }
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let rootMirror = Mirror(reflecting: rootView)
        if let destinationView = rootMirror.descendant("content") as? DestinationView {
            navigationItem.title = destinationView.navigationBarTitleConfiguration.title
            navigationItem.largeTitleDisplayMode = destinationView.navigationBarTitleConfiguration.displayMode.uikitDisplayMode

        }
    }

    private func printChildren(mirror: Mirror) {
        mirror.children.forEach { print($0) }
    }
}
