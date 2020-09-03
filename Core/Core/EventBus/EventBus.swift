//
//  EventBus.swift
//  Core
//
//  Created by Adolfo Montilla on 31-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation

public class EventBus
{
    public static let shared = EventBus()
    
    private var weakListeners: [WeakBox<AnyObject>] = []
    
    public func add<T: Event>(listener: Listener<T>)
    {
        cleanDellocateListeners()
        guard !contains(listener) else { fatalError()}
        weakListeners.append(WeakBox(listener))
    }
    
    public func emit<T: Event>(event: T) throws
    {
        cleanDellocateListeners()
        
        let list = weakListeners.compactMap { $0.value as? Listener<T> }
        
        if list.isEmpty
        {
            throw EventBusError.listIsEmpty
        }
        
        list.first?.handle(event: event)
    }
    
    public func removeAllListeners()
    {
        weakListeners = []
    }
}


public extension EventBus
{
    func cleanDellocateListeners()
    {
        weakListeners = weakListeners.filter{ $0.value != nil}
    }
    
    func contains<T: Event>(_ listener: Listener<T>) -> Bool
    {
        return weakListeners.compactMap { $0.value as? Listener<T> }.contains(listener)
    }
}

enum EventBusError: Error
{
    case listIsEmpty
}
