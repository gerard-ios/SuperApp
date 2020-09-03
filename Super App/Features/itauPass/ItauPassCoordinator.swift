//
//  itauPass.swift
//  Super App
//
//  Created by Adolfo Montilla on 31-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//


import Foundation
import UIKit
import ItauPass
import Core
import Login

final class ItauPassCoordinator: Listener<ItauPassExternalEvents>
{
    weak var rootViewController: UIViewController?
    
    private var itauPassCoordinator: ItauPass.ItauPassCoordinator?
    
    init(rootViewController: UIViewController?)
    {
        self.rootViewController = rootViewController
        super.init()
    }
    
    func start(completion: @escaping () -> Void = {})
    {
        guard let rootViewController = self.rootViewController else { return }
        
        let coordinator = ItauPass.ItauPassCoordinator(rootViewController: rootViewController)
               
        self.itauPassCoordinator = coordinator
        
        coordinator.coordinator = self
        coordinator.start()
               
        completion()
    }
    
    override func handle(event: ItauPassExternalEvents)
    {
        switch event
        {
        case .showLogin:
            
            let loginCoordinator: LoginCoordinator?
            
            loginCoordinator = LoginCoordinator(rootViewController: self.rootViewController, theme: LoginViewThemeImpl())
            
            loginCoordinator?.start()
            
        }
    }
    
}

/*
 let navigationController = UINavigationController()
    
    
    let loginCoordinator = LoginCoordinator(rootViewController: navigationController, theme: LoginViewThemeImpl())
    
    loginCoordinator.delegate = self
    // Login Coordinator.Delegate = Self
    
    self.rootContainerViewController.addChild(navigationController)
    self.rootContainerViewController.view.addSubview(navigationController.view)
    navigationController.didMove(toParent: self.rootContainerViewController)
    
    self.loginCoordinator = loginCoordinator
    
    loginCoordinator.start {}
 */
