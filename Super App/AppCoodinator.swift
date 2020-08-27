//
//  AppCoodinator.swift
//  Super App
//
//  Created by Adolfo Montilla on 18-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit
import Core
import Login

final class AppCoordinator
{
    private var rootContainerViewController: RootContainerViewController
    weak var rootViewController: UIViewController?
    private let window: UIWindow?
    
    private var loginCoordinator: LoginCoordinator?
    
    init(window: UIWindow)
    {
        self.window = window
        self.rootContainerViewController = RootContainerViewController()
        
        setupAppCoordinator()
    }
    
    private func setupAppCoordinator()
    {
        self.window?.rootViewController = self.rootContainerViewController
        //EvenBus
    }
    
   
    
    private func createLoginScreen()
    {
        // En el banco viene de una libreria propia
        let navigationController = UINavigationController()
        
        navigationController.setNavigationBarHidden(true, animated: false)
        
        self.rootViewController = navigationController
        
        let loginCoordinator = LoginCoordinator(rootViewController: navigationController, theme: LoginViewThemeImpl())
        
        loginCoordinator.delegate = self
        // Login Coordinator.Delegate = Self
        
        self.rootContainerViewController.addChild(navigationController)
        self.rootContainerViewController.view.addSubview(navigationController.view)
        navigationController.didMove(toParent: self.rootContainerViewController)
        
        self.loginCoordinator = loginCoordinator
        
        loginCoordinator.start {}
    }
    
}


extension AppCoordinator: Coordinator
{
    
    func start(completion: @escaping () -> Void = {}) // investigar el valor por defecto
    {
        self.window?.makeKeyAndVisible()
        
        //valida que no tenga un jailbrake
        self.createLoginScreen()
    }
    
    
}

extension AppCoordinator: LoginCoordinatorDelegate
{
    func didCompleteLogin(name: String, rut: String, segmentID: String, segmentTheme: String?)
    {
        print("didCompleteLogin")
    }
}
