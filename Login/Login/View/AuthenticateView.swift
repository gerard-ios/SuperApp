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

    weak var delegate: AuthenticateViewDelegate?
    
    override init(frame: CGRect = .zero)
    {
        super.init(frame: frame)
        setupConfiguration()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var mainStackView: UIStackView =
    {
        let stack = UIStackView(frame: .zero)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        
        stack.spacing = 16
        
        return stack
    }()
    
    var loginButton: UIButton =
    {
        let view = UIButton(frame: .zero)
        view.setTitle("loginButton", for: .normal)
        view.backgroundColor = .blue
        view.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        return view
    }()
    
    
    @objc
    func loginButtonTapped()
    {
        delegate?.loginWithState()
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
        self.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(loginButton)
        
    }
    
    func setupConstraints()
    {
        self.loginButton.setupConstraint { (view) -> [NSLayoutConstraint] in
            [
                .top(firsItem: view, secondItem: self, constant: 24),
                .left(firsItem: view, secondItem: self, constant: 24)
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
