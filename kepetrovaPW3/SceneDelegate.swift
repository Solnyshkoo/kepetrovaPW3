//
//  SceneDelegate.swift
//  kepetrovaPW3
//
//  Created by Ksenia Petrova on 04.10.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var tabBarController:UITabBarController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        tabBarController = UITabBarController()
        let viewControllers = [
            TableViewController(),
            StackViewController(),
            CollectionViewController()
        ]
        let nav = UINavigationController(rootViewController: tabBarController!)
        
        tabBarController!.setViewControllers(viewControllers, animated: false)
        
        
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
        tabBarController!.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self,action: #selector(createAlarm(sender:)))
        
        guard let items = tabBarController!.tabBar.items else { return }
        let titles = ["Stack", "Table", "Collection"]
        
        
        for i in 0..<viewControllers.count {
            viewControllers[i].title = titles[i]
            items[i].image = UIImage(named: titles[i])
            // Images name is the same as title. So we can remove images array but still set images using titles array.
        }
        
        
    }
    @objc func createAlarm(sender: UIBarButtonItem){
        let next:AlarmCreator = AlarmCreator()
        tabBarController?.navigationController?.pushViewController(
            next,
            animated: true
        )
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

