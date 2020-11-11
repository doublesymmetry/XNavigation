# XNavigation ↣

Take control over navigation in your SwiftUI app. Navigate without using NavigationLink.

## Features
- [x] Present View Controllers from your SwiftUI views
- [x] Uses the UINavigationController already present when using a NavigationView
- [x] Smooth transitions between navigation bars when presenting

## Overview of Package
This package has 2 main components to it:
1. A Navigation class exposing the navigation methods.
It's created at the start of the app and passed to SwiftUI views via environmentObject.

2. A DestinationView protocol used by SwiftUI Views that can be presented to expose their navigation bar title details.

There's a very detailed write-up on how this came to be and how it was built on [Medium](https://medium.com/double-symmetry/navigating-without-navigationlink-in-swiftui-afd8109f0602).

## Getting Started

Create the Navigation object and passing it in to your root view in your SceneDelegate.

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    let contentView = ContentView()

    // Use a UIHostingController as window root view controller.
    if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        let navigation = Navigation(window: window)
        // here we pass in the navigation object to our app's root view.
        let rootView = UIHostingController(rootView: contentView.environmentObject(navigation))

        window.rootViewController = rootView

        self.window = window
        self.navigation = navigation

        window.makeKeyAndVisible()
    }
}
```

Use the navigation object in your root app view to present other views.

```swift
struct ContentView: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
                .navigationBarTitle("Example", displayMode: .large)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            navigation.pushView(AnyView(SettingsView()), animated: true)
                        }) { Image(systemName: "gear") }
                    }
                }
        }
    }
}
```

Have your presented view conform to `DestinationView` to expose navigation title bar properties.
You can use the custom .navigationBarTitle modifier to pass in your configuration object.

```swift
struct SettingsView: View, DestinationView {
    var navigationBarTitleConfiguration = NavigationBarTitleConfiguration(title: "Settings", displayMode: .inline)

    var body: some View {
        Text("Settings View")
            .navigationBarTitle(configuration: navigationBarTitleConfiguration)
    }
}
```

## FAQ

#### Can I present a ViewController - i.e. a SFSafariViewController?
Yes. Instead of calling pushView which takes a SwiftUIView, call pushViewController, which works with UIViewController's.

#### Can I present a ViewController as a modal?
Yes. You can use the present(_ viewController: UIViewController) method in the navigation object.

