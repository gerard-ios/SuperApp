//
//  LoginCoordinator.swift
//  Login
//
//  Created by Adolfo Montilla on 18-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit
import Core

public protocol LoginCoordinated
{
    func handle(event: InternalLoginEvent)
}

public final class LoginCoordinator: LoginCoordinated
{
    
    private let theme: LoginViewTheme
    
    
    public func handle(event: InternalLoginEvent) {
        switch event {
        case .showItauPass:
            showItauPass()
        
        }
    }
    
    
    public weak var rootViewController: UIViewController?
    
    public init(rootViewController: UIViewController,
                theme: LoginViewTheme)
    {
        self.rootViewController = rootViewController
        self.theme = theme
    }
    
    public func showItauPass()
    {
        try? EventBus.shared.emit(event: LoginEvent.itauPass)
    }
}

extension LoginCoordinator: Coordinator
{
    public func start(completion: @escaping () -> Void = {})
    {
        let viewController = composeLoginViewController()
        
        guard let navigationController = self.rootViewController as? UINavigationController else  {return}
        
        navigationController.pushViewController(viewController, animated: false)
    }
    
    private func composeLoginViewController() -> LoginViewController
    {
        let viewController = LoginViewController(coordinator: self, withTheme: theme)

        return viewController
    }
    
}
