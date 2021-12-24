//
//  WindowReader.swift
//  XNavigation
//
//  Created by David Chavez on 24.12.21.
//  Copyright © 2021 Double Symmetry UG. All rights reserved.
//

import SwiftUI

@frozen public struct WindowReader<Content>: View where Content: View {
    private var content: (UIWindow?) -> Content
    
    private var window: UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegate.window else {
                  return nil
              }
        return window
    }
    
    public init(@ViewBuilder content: @escaping (UIWindow?) -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content(window)
    }
}
