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
    
    private(set) lazy var accountView: AuthenticateView =
    {
        
        let style = AuthenticateView.Style(mainColor: UIColor.black)
        
        let view = AuthenticateView(style: style, frame: .zero)
        
        return view
        
    }()
    
    private lazy var accountViewVerticalCenter: NSLayoutConstraint = .verticalCenter(firstView: self.accountView, secondView: self)
    
    init(theme: LoginViewTheme,
         frame: CGRect = .zero)
    {
        self.theme = theme
        super.init(frame: .zero)
        setupConfiguration()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: BaseViewConfiguration
{
    func configureView()
    {
        print("configureView")
    }

    func setupConstraints()
    {
        accountView.setupConstraint { view -> [NSLayoutConstraint] in

            let accountViewHeightAnchor: CGFloat = 100.0

            let accountViewWidth = UIScreen.main.bounds.width - 32

            let accountViewHeightConstraint: NSLayoutConstraint = .height(view: view, constant: accountViewHeightAnchor)

            accountViewHeightConstraint.priority = .defaultLow

            return [
                accountViewVerticalCenter,
                .horizontalCenter(firstView: view, secondView: self),
                .width(view: view, constant: accountViewWidth),
                accountViewHeightConstraint
            ]
        }
    }
    
    func buildViewHierarchy()
    {
        self.addSubViews([accountView])
    }
}

public extension UIView
{
    func addSubViews(_ views: [UIView])
    {
        views.forEach
        {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}
