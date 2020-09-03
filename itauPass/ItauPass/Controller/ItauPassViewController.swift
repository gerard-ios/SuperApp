//
//  ItauPassViewController.swift
//  ItauPass
//
//  Created by Adolfo Montilla on 31-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit
import Core

class ItauPassViewController: UIViewController
{
    let coordinator: ItauPassCoordinator?
    let viewItauPass = ItauPassView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewItauPass.delegate = self
    }
    
    init(coordinator: ItauPassCoordinator?)
    {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .blue
        //self.view.addSubview(viewItauPass)
        
        EventBus.shared.removeAllListeners()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView()
    {
        self.view = viewItauPass
    }
}

extension ItauPassViewController: ItauPassViewDelegate
{
    func showLogin()
    {
        coordinator?.handle(event: .showLogin)
        
    }
    
    
}
