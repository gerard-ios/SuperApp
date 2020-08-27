//
//  Coordinator.swift
//  Core
//
//  Created by Adolfo Montilla on 26-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject
{
    var rootViewController: UIViewController? { get }
    func start(completion: @escaping () -> Void)
}
