//
//  LoginCoordinator.swift
//  Super App
//
//  Created by Adolfo Montilla on 18-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit
import Core
import Login

protocol LoginCoordinatorDelegate: AnyObject
{
    func didCompleteLogin(name: String,
                          rut: String,
                          segmentID: String,
                          segmentTheme: String?)
}

final class LoginCoordinator
{
    weak var rootViewController: UIViewController?
    
    weak var delegate: LoginCoordinatorDelegate?
    
    private var loginCoordinator: Login.LoginCoordinator?
    
    private let theme: LoginViewTheme
    
    
    init(rootViewController: UIViewController,
         theme: LoginViewTheme)
    {
        self.rootViewController = rootViewController
        self.theme = theme
    }
}

extension LoginCoordinator: Coordinator
{
    func start(completion: @escaping () -> Void = {})
    {
        guard let rootViewController = self.rootViewController else { return }
        
        let coordinator = Login.LoginCoordinator(rootViewController: rootViewController, theme: theme)
        
        self.loginCoordinator = coordinator
        
        coordinator.start()
        
        completion()
    }
}
