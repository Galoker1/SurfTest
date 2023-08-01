//
//  SceneDelegate.swift
//  Surf
//
//  Created by Егор  Хлямов on 01.08.2023.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate{
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let tabBarController = ViewController()
        guard let windowScene = (scene as? UIWindowScene) else{return}
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    }


