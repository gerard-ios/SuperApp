//
//  File.swift
//  Login
//
//  Created by Adolfo Montilla on 19-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController
{
    private let theme: LoginViewTheme
    private var mainView: LoginView?
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
//    {
//        super.init(nibName: nil, bundle: nil)
//
//        //self.view.backgroundColor = .blue
//    }
    
    init(withTheme theme: LoginViewTheme)
    {
        self.theme = theme
        
        self.mainView = LoginView(theme: theme)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView()
    {
        self.view = self.mainView
    }
    
    
}

extension LoginViewController: AuthenticateViewDelegate
{
    func loginWithState()
    {
        print("Click")
    }
    
    
}
