//
//  SceneDelegate.swift
//  Pokemon
//
//  Created by Александра Захаревич on 6.12.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let appContainer = PokemonDepentencyContainer()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let rootViewController = appContainer.makeMainViewController()
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = rootViewController
        window?.windowScene = windowScene
    }
}

