//
//  LoginCoordinator.swift
//  Super App
//
//  Created by Adolfo Montilla on 18-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit
import Login
import Core
import ItauPass

protocol LoginCoordinatorDelegate: AnyObject
{
    func didCompleteLogin(name: String,
                          rut: String,
                          segmentID: String,
                          segmentTheme: String?)
}

final class LoginCoordinator: Listener<LoginEvent>
{
    weak var rootViewController: UIViewController?
    
    weak var delegate: LoginCoordinatorDelegate?
    
    private var loginCoordinator: Login.LoginCoordinator?
    
    private let theme: LoginViewTheme
    
    
    
    override func handle(event: LoginEvent)
    {
        switch event
        {
        case .itauPass:
            
            let itauPassCoordinator: ItauPassCoordinator?
            
            itauPassCoordinator = ItauPassCoordinator(rootViewController: self.rootViewController)
            
            itauPassCoordinator?.start()
            
        }
    }
    
    init(rootViewController: UIViewController?,
         theme: LoginViewTheme)
    {
        self.rootViewController = rootViewController
        self.theme = theme
        super.init()
        EventBus.shared.add(listener: self)
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
