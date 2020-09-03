//
//  ItauPassCoordinator.swift
//  ItauPass
//
//  Created by Adolfo Montilla on 31-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit
import Core

public class ItauPassCoordinator
{
    public weak var rootViewController: UIViewController?
    public var coordinator: Listener<ItauPassExternalEvents>?
    
    
    public init(rootViewController: UIViewController)
    {
        self.rootViewController = rootViewController
        
    }
    
    func handle(event: ItauPassExternalEvents)
    {
        switch event {
        case .showLogin:
            showLogin()
        }
    }
    
    func showLogin()
    {
        self.coordinator?.handle(event: .showLogin)
    }
}

extension ItauPassCoordinator: Coordinator
{
    public func start(completion: @escaping () -> Void = {})
    {
        let viewController = composeViewController()
        
        guard let navigationController = self.rootViewController as? UINavigationController else  {return}
        
        navigationController.pushViewController(viewController, animated: false)
    }
    
    private func composeViewController() -> ItauPassViewController
    {
        let viewController = ItauPassViewController(coordinator: self)

        return viewController
    }
    
}
