//
//  ItauPassView.swift
//  ItauPass
//
//  Created by Adolfo Montilla on 02-09-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.

import Foundation
import UIKit
import Core
import Login

protocol ItauPassViewDelegate: AnyObject
{
    func showLogin()
}

class ItauPassView: UIView
{
    weak var delegate: ItauPassViewDelegate?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) lazy var button: UIButton =
    {
        //let view = UIButton(frame: .zero)
        let view = UIButton(frame: CGRect(x: 20, y: 20, width: 200, height: 60))
        view.setTitle("Show Login", for: .normal)
        view.backgroundColor = .red
        view.isEnabled = true
        view.addTarget(self, action: #selector(ItauPassView.buttonTapped), for: .touchUpInside)

        return view
    }()
    
    @objc
    func buttonTapped()
    {
        print("ItauCLick")
        delegate?.showLogin()
    }

    
}
