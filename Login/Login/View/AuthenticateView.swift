//
//  AuthenticateView.swift
//  Login
//
//  Created by Adolfo Montilla on 25-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit
import Core

protocol AuthenticateViewDelegate: AnyObject
{
    func loginWithState()
}

class AuthenticateView: UIView
{
    enum State
    {
        case ´default´
        case recorded(name: String)
        case touchId(name: String)
    }
    
    struct Style
    {
        var mainColor: UIColor
//        var invalidColor: UIColor
//        var initianGradientColor: UIColor
//        var finalGradientColor: UIColor
//        var loginButtonTitleColor: UIColor
    }
    
    weak var delegate: AuthenticateViewDelegate?
    
    private let style: AuthenticateView.Style
    
    private let currentState: AuthenticateView.State
    
    init(style: AuthenticateView.Style, state: AuthenticateView.State = .´default´, frame: CGRect = .zero)
    {
        self.style = style
        self.currentState = state
        super.init(frame: frame)
        setupConfiguration()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var innerView: UIView =
    {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .black
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView =
    {
        //let stack = UIStackView(frame: .zero)
        
        let stack = UIStackView(frame: CGRect(x: 40, y: 40, width: 400, height: 120))
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        
        stack.spacing = 40
        
        return stack
    }()
    
    private(set) lazy var loginButton: UIButton =
    {
        //let view = UIButton(frame: .zero)
        let view = UIButton(frame: CGRect(x: 20, y: 20, width: 200, height: 60))
        view.setTitle("loginButton", for: .normal)
        view.backgroundColor = .blue
        view.isEnabled = true
        view.addTarget(self, action: #selector(AuthenticateView.loginButtonTapped), for: .touchUpInside)

        return view
    }()

    var loginButtonTest: UIButton =
    {
        //let view = UIButton(frame: .zero)
        let view = UIButton(frame: CGRect(x: 20, y: 20, width: 200, height: 60))
        view.setTitle("loginButtonTest", for: .normal)
        view.backgroundColor = .blue
        view.isEnabled = true
        view.addTarget(self, action: #selector(loginButtonTappedTest), for: .touchUpInside)
        
        return view
    }()
    
    @objc
    func loginButtonTapped()
    {
        debugPrint("Click")
        //delegate?.loginWithState()
    }
    
    @objc
    func loginButtonTappedTest(_ sender: UIButton)
    {
        print("Click")
        //delegate?.loginWithState()
    }
    
}



extension AuthenticateView: BaseViewConfiguration
{
    func configureView()
    {
        print("configureView")
    }
    
    func buildViewHierarchy()
    {
        // el problema que tenia con el click es que las constraints están mal colocadas. Validar!!!!!
        
        //addSubview(loginButton)
        addSubview(loginButton)
        
        //mainStackView.addArrangedSubview(innerView)
        
        //innerView.addSubview(loginButton)
    }
    
    func setupConstraints()
    {
        self.loginButton.setupConstraint { (view) -> [NSLayoutConstraint] in
            [
                .top(firsItem: view, secondItem: self, constant: 100),
                .left(firsItem: view, secondItem: self, constant: 100)
            ]
        }
    }
}

public extension UIView
{
    func setupConstraint(_ activate: (UIView) -> [NSLayoutConstraint])
    {
        NSLayoutConstraint.activate(activate(self))
    }
}

extension NSLayoutConstraint
{
     public static func top(firsItem: UIView,
                           secondItem: UIView,
                           constant: CGFloat = 0,
                           multiplier: CGFloat = 1,
                           relateBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: firsItem,
                                  attribute: NSLayoutConstraint.Attribute.top,
                                  relatedBy: relateBy,
                                  toItem: secondItem,
                                  attribute: NSLayoutConstraint.Attribute.top,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
     public static func left(firsItem: UIView,
                           secondItem: UIView,
                           constant: CGFloat = 0,
                           multiplier: CGFloat = 1,
                           relateBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint
    {
        return NSLayoutConstraint(item: firsItem,
                                  attribute: NSLayoutConstraint.Attribute.left,
                                  relatedBy: relateBy,
                                  toItem: secondItem,
                                  attribute: NSLayoutConstraint.Attribute.left,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
    public static func height(view: UIView,
                              constant: CGFloat,
                              multiplier: CGFloat = 1,
                              relatedBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint {

        return NSLayoutConstraint(item: view,

                                  attribute: NSLayoutConstraint.Attribute.height,

                                  relatedBy: relatedBy,

                                  toItem: nil,

                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,

                                  multiplier: multiplier,

                                  constant: constant)

    }
    
    public static func verticalCenter(firstView: UIView, secondView: UIView, constant: CGFloat = 0)

        -> NSLayoutConstraint {

            return NSLayoutConstraint(item: firstView,

                                      attribute: NSLayoutConstraint.Attribute.centerY,

                                      relatedBy: NSLayoutConstraint.Relation.equal,

                                      toItem: secondView,

                                      attribute: NSLayoutConstraint.Attribute.centerY,

                                      multiplier: 1,

                                      constant: constant)

    }
    
    public static func horizontalCenter(firstView: UIView, secondView: UIView, constant: CGFloat = 0)

         -> NSLayoutConstraint {

             return NSLayoutConstraint(item: firstView,

                                       attribute: NSLayoutConstraint.Attribute.centerX,

                                       relatedBy: NSLayoutConstraint.Relation.equal,

                                       toItem: secondView,

                                       attribute: NSLayoutConstraint.Attribute.centerX,

                                       multiplier: 1,

                                       constant: constant)

     }
    
    public static func width(view: UIView,

                             constant: CGFloat,

                             multiplier: CGFloat = 1,

                             relatedBy: NSLayoutConstraint.Relation = NSLayoutConstraint.Relation.equal) -> NSLayoutConstraint {

        return NSLayoutConstraint(item: view,

                                  attribute: NSLayoutConstraint.Attribute.width,

                                  relatedBy: relatedBy,

                                  toItem: nil,

                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,

                                  multiplier: multiplier,

                                  constant: constant)

    }
}
