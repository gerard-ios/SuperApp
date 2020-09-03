//
//  WeakBox.swift
//  Core
//
//  Created by Adolfo Montilla on 31-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation

struct WeakBox<T: AnyObject>
{
    weak var value: T?
    
    init(_ value: T)
    {
        self.value = value
    }
    
}
