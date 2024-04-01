//
//  SceneDelegate.swift
//  p7m2l2
//
//  Created by m.kushakov on 31.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow (windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = SettingsViewController()
        window?.makeKeyAndVisible()
    }
}

