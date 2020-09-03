//
//  Listener.swift
//  Core
//
//  Created by Adolfo Montilla on 31-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation

open class Listener<T: Event>
{
    
    public var identifier: String
    {
        return String(describing: self)
    }
    
    public init() {}
    
    open func handle(event: T){}
    
}

extension Listener: Hashable
{
    
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: Listener<T>, rhs: Listener<T>) -> Bool
    {
        return lhs.identifier == rhs.identifier
    }
    
}
