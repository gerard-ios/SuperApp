//
//  LoginView.swift
//  Login
//
//  Created by Adolfo Montilla on 20-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit
import Core

class LoginView: UIView
{
    let theme: LoginViewTheme
    
    weak var delegate: AuthenticateViewDelegate?
    {
        didSet
        {
            accountView.delegate = delegate
        }
    }
    
    private(set) lazy var accountView = AuthenticateView()
    
    private lazy var accountViewVerticalCenter: NSLayoutConstraint = .verticalCenter(firstView: self.accountView, secondView: self)
    
    init(theme: LoginViewTheme,
         frame: CGRect = .zero)
    {
        self.theme = theme
        
        super.init(frame: .zero)

        accountView.buildViewHierarchy()
        //self.buildHierarchy()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

extension LoginView
{

    func setupConstraints() {
        print("setupConstraints")
    }
    
    func configureView() {
        print("configureView")
    }
    
//    func setupConstraint()
//    {
//        accountView.setupConstraint { view -> [NSLayoutConstraint] in
//
//            let accountViewHeightAnchor: CGFloat = 100.0
//
//            let accountViewWidth = UIScreen.main.bounds.width - 32
//
//            let accountViewHeightConstraint: NSLayoutConstraint = .height(view: view, constant: accountViewHeightAnchor)
//
//            accountViewHeightConstraint.priority = .defaultLow
//
//            return [
//                accountViewVerticalCenter,
//                .horizontalCenter(firstView: view, secondView: self),
//                .width(view: view, constant: accountViewWidth),
//                accountViewHeightConstraint
//
//            ]
//
//        }
//
//    }
    
    func buildViewHierarchy()
    {
        //self.addSubViews([accountView])
        //self.addSubViews([accountView])
    }
}