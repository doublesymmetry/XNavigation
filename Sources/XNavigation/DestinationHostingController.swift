//
//  DestinationHostingController.swift
//  XNavigation
//
//  Created by David Chavez on 11.11.20.
//  Copyright © 2020 Double Symmetry UG. All rights reserved.
//

import SwiftUI

open class DestinationHostingController<T: View>: UIHostingController<T> {
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let rootMirror = Mirror(reflecting: rootView)

        let storageMirror = rootView is AnyView ? rootMirror : Mirror(reflecting: rootMirror.descendant("content")!)
        let navigationTitleConfiguration = extractNavigationTitleConfiguration(storageMirror: storageMirror)

        if let navigationTitleConfiguration = navigationTitleConfiguration {
            navigationItem.title = navigationTitleConfiguration.title
            navigationItem.largeTitleDisplayMode = navigationTitleConfiguration.displayMode.uikitDisplayMode
        }
    }

    private func extractNavigationTitleConfiguration(storageMirror: Mirror) -> NavigationBarTitleConfiguration? {
        guard let storage = storageMirror.descendant("storage") else { return nil }
        let storageMirror = Mirror(reflecting: storage)

        guard let swiftUIView = storageMirror.descendant("view") else { return nil }
        if let view = swiftUIView as? DestinationView {
            return view.navigationBarTitleConfiguration
        }

        return nil
    }
}
